import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../core/theme/app_colors.dart';

import '../../../../core/theme/app_theme.dart';

import '../../shared/models/maintenance_models.dart' show MaintenanceTaskStatus;
import '../provider/maintenance_provider.dart';
import '../widgets/booking_selector.dart';
import '../widgets/charge_banner.dart';
import '../widgets/history_section.dart';
import '../widgets/inspections_section.dart';
import '../widgets/inventory_section.dart';
import '../widgets/maintenance_bottom_nav_bar.dart';
import '../widgets/maintenance_hub_tab_selector.dart';
import '../widgets/open_tasks_section.dart';

/// Route name/path constants for the Maintenance feature.
/// Wire these into the app's go_router config — see
/// `lib/features/maintenance/maintenance_hub/routes/maintenance_routes.dart`.
class MaintenanceHubScreen extends StatefulWidget {
  const MaintenanceHubScreen({super.key});

  static const routeName = 'maintenance';
  static const routePath = '/maintenance';

  @override
  State<MaintenanceHubScreen> createState() => _MaintenanceHubScreenState();
}

class _MaintenanceHubScreenState extends State<MaintenanceHubScreen> {
  @override
  Widget build(BuildContext context) {
    return const _MaintenanceHubView();
  }
}

class _MaintenanceHubView extends StatelessWidget {
  const _MaintenanceHubView();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MaintenanceProvider>();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: const Text('Maintenance Hub', style: AppTextStyles.appBarTitle),
      ),
      body: SafeArea(
        top: false,
        child: provider.isLoading && provider.bookings.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : provider.errorMessage != null
            ? _ErrorState(
                message: provider.errorMessage!,
                onRetry: provider.refresh,
              )
            : RefreshIndicator(
                onRefresh: provider.refresh,
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                  children: [
                    MaintenanceHubTabSelector(
                      selected: provider.selectedTab,
                      onChanged: provider.setTab,
                    ),
                    const SizedBox(height: 16),
                    BookingSelector(
                      bookings: provider.bookings,
                      selected: provider.selectedBooking,
                      onChanged: provider.selectBooking,
                    ),
                    if (provider.outstandingCharge != null) ...[
                      const SizedBox(height: 14),
                      ChargeBanner(
                        charge: provider.outstandingCharge!,
                        onView: () {
                          _showChargeDetails(context);
                        },
                        onPay: () {},
                      ),
                    ],
                    const SizedBox(height: 22),
                    if (provider.selectedTab == MaintenanceHubTab.open)
                      _OpenTabContent(provider: provider)
                    else
                      HistorySection(records: provider.chargeHistory),
                  ],
                ),
              ),
      ),
      bottomNavigationBar: MaintenanceBottomNavBar(
        current: AppNavDestination.maintenance,
        notificationCount: 1,
        onSelect: (destination) => _handleNavSelect(context, destination),
      ),
    );
  }

  void _showChargeDetails(BuildContext context) {
    final provider = Provider.of<MaintenanceProvider>(context, listen: false);
    final index = provider.openTasks.indexWhere(
      (task) => task.status == MaintenanceTaskStatus.outstanding,
    );

    if (index != -1) {
      context.push('/charge/${index.toString()}');
    } else {
      SnackBar(content: Text('No Record Found For the Selection'));
    }
  }

  void _handleNavSelect(BuildContext context, AppNavDestination destination) {
    switch (destination) {
      case AppNavDestination.maintenance:
        return; // already here
      case AppNavDestination.home:
      case AppNavDestination.book:
      case AppNavDestination.notifications:
        // Wire these up to the app's existing go_router routes, e.g.:
        // context.go('/home'); context.go('/book'); context.go('/notifications');
        break;
    }
  }
}

class _OpenTabContent extends StatelessWidget {
  const _OpenTabContent({required this.provider});

  final MaintenanceProvider provider;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InventorySection(
          records: provider.inventory,
          onViewReport: (record) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Opening report for ${record.title}…')),
            );
          },
        ),
        const SizedBox(height: 22),
        InspectionsSection(
          records: provider.inspections,
          onTapInspection: (record) {
            context.push('/preinspection/${record.id}');
          },
        ),
        const SizedBox(height: 22),
        OpenTasksSection(
          tasks: provider.openTasks,
          onRaiseTask: () {},
          onTapTask: (task) {
            final provider = Provider.of<MaintenanceProvider>(
              context,
              listen: false,
            );

            final index = provider.openTasks.indexWhere(
              (item) =>
                  item.id == task.id &&
                  item.status == MaintenanceTaskStatus.outstanding,
            );

            if (index != -1) {
              context.push('/charge/$index');
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('No Record Found For the Selection'),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}

class _ErrorState extends StatelessWidget {
  const _ErrorState({required this.message, required this.onRetry});

  final String message;
  final Future<void> Function() onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              style: AppTextStyles.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: onRetry,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
              ),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
