import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kxinspections/app/router/routes.dart';
import 'package:kxinspections/features/maintenance/bottom_nav/screens/bottom_nav_screen.dart';
import 'package:kxinspections/features/maintenance/charge/screens/charge_screen.dart';
import 'package:kxinspections/features/maintenance/contest_charge/screens/contest_charge_screen.dart';
import 'package:kxinspections/features/maintenance/inspection/screens/inspection_screen.dart';

/// Application router. Deep-link friendly paths map 1:1 to feature screens.
class AppRouter {
  AppRouter({GlobalKey<NavigatorState>? navigatorKey})
    : router = GoRouter(
        navigatorKey: navigatorKey ?? GlobalKey<NavigatorState>(),
        initialLocation: AppRoutes.bottomNav,
        debugLogDiagnostics: true,
        routes: [
          GoRoute(
            path: AppRoutes.bottomNav,
            name: 'bottom-nav',
            builder: (context, state) => const MaintenanceHubScreen(),
          ),
          // GoRoute(
          //   path: AppRoutes.maintenance,
          //   name: 'maintenance',
          //   builder: (context, state) => const MaintenanceHubScreen(),
          // ),
          GoRoute(
            path: AppRoutes.inspection,
            name: 'inspection',
            builder: (context, state) {
              final id = state.pathParameters['id']!;
              return InspectionScreen(inspectionId: id);
            },
          ),
          GoRoute(
            path: AppRoutes.charge,
            name: 'charge',
            builder: (context, state) {
              final id = state.pathParameters['id']!;
              return ChargeScreen(index: id);
            },
          ),
          GoRoute(
            path: AppRoutes.contest,
            name: 'contest',
            builder: (context, state) {
              final id = state.pathParameters['id']!;
              return ContestChargeScreen(chargeId: id);
            },
          ),
        ],
        errorBuilder: (context, state) => Scaffold(
          appBar: AppBar(title: const Text('Page not found')),
          body: Center(
            child: Text(state.error?.toString() ?? 'Unknown routing error'),
          ),
        ),
      );

  final GoRouter router;
}
