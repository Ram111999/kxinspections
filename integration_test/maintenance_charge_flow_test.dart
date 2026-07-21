import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:go_router/go_router.dart';
import 'package:kxinspections/features/maintenance/bottom_nav/screens/bottom_nav_screen.dart';
import 'package:provider/provider.dart';

import 'package:kxinspections/features/maintenance/bottom_nav/datasource/maintenance_mock_api.dart';
import 'package:kxinspections/features/maintenance/bottom_nav/provider/maintenance_provider.dart';
import 'package:kxinspections/features/maintenance/bottom_nav/repository/dio_maintenance_repository.dart';

import 'package:kxinspections/features/maintenance/charge/screens/charge_screen.dart';

import 'package:kxinspections/features/maintenance/shared/models/maintenance_models.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('User accepts charge and maintenance hub updates', (
    tester,
  ) async {
    final provider = MaintenanceProvider(
      repository: DioMaintenanceRepository(MaintenanceMockApi()),
    );
    final router = GoRouter(
      initialLocation: '/maintenance',

      routes: [
        GoRoute(
          path: '/maintenance',
          builder: (context, state) {
            return const MaintenanceHubScreen();
          },
        ),

        GoRoute(
          path: '/charge/:index',
          builder: (context, state) {
            return ChargeScreen(index: state.pathParameters['index']!);
          },
        ),
      ],
    );

    await tester.pumpWidget(
      ChangeNotifierProvider.value(
        value: provider,

        child: MaterialApp.router(routerConfig: router),
      ),
    );

    // Wait for MaintenanceProvider._load()

    await tester.pumpAndSettle(const Duration(seconds: 5));
    expect(provider.outstandingCharge, isNotNull);

    expect(provider.openTasks.isNotEmpty, true);

    expect(
      provider.openTasks.any(
        (task) => task.status == MaintenanceTaskStatus.outstanding,
      ),
      true,
    );
    // -------------------------
    // Verify Maintenance Hub
    // -------------------------

    expect(find.text('Maintenance Hub'), findsOneWidget);

    expect(provider.openTasks.length, 3);

    // -------------------------
    // Tap View on ChargeBanner
    // -------------------------

    expect(find.text('View'), findsOneWidget);

    await tester.tap(find.text('View'));

    await tester.pumpAndSettle();

    // -------------------------
    // Verify Charge Screen
    // -------------------------

    expect(find.text('Charge'), findsOneWidget);

    // -------------------------
    // Accept Charge
    // -------------------------

    await tester.drag(
      find.byType(SingleChildScrollView),
      const Offset(0, -600),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text('Accept'));

    await tester.pumpAndSettle();

    expect(find.byType(MaintenanceHubScreen), findsOneWidget);

    // // Verify provider state changed

    expect(provider.openTasks[2].status, MaintenanceTaskStatus.accepted);
  });
}
