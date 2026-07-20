import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';

/// The 4 top-level destinations in the bottom navigation bar.
enum AppNavDestination { home, book, maintenance, notifications }

/// App-wide bottom navigation bar.
///
/// If the project already has a bottom navigation bar widget, update
/// it to include the `maintenance` destination (with a badge for
/// unread notifications) instead of adding a second nav bar.
class MaintenanceBottomNavBar extends StatelessWidget {
  const MaintenanceBottomNavBar({
    super.key,
    required this.current,
    required this.onSelect,
    this.notificationCount = 0,
  });

  final AppNavDestination current;
  final ValueChanged<AppNavDestination> onSelect;
  final int notificationCount;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: const BoxDecoration(
          color: AppColors.surface,
          border: Border(top: BorderSide(color: AppColors.border)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _NavItem(
              icon: Icons.home_outlined,
              selectedIcon: Icons.home,
              label: 'Home',
              selected: current == AppNavDestination.home,
              onTap: () => onSelect(AppNavDestination.home),
            ),
            _NavItem(
              icon: Icons.calendar_today_outlined,
              selectedIcon: Icons.calendar_today,
              label: 'Book',
              selected: current == AppNavDestination.book,
              onTap: () => onSelect(AppNavDestination.book),
            ),
            _NavItem(
              icon: Icons.build_outlined,
              selectedIcon: Icons.build,
              label: 'Maintenance',
              selected: current == AppNavDestination.maintenance,
              onTap: () => onSelect(AppNavDestination.maintenance),
            ),
            _NavItem(
              icon: Icons.notifications_outlined,
              selectedIcon: Icons.notifications,
              label: 'Notifications',
              selected: current == AppNavDestination.notifications,
              onTap: () => onSelect(AppNavDestination.notifications),
              badgeCount: notificationCount,
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.selectedIcon,
    required this.label,
    required this.selected,
    required this.onTap,
    this.badgeCount = 0,
  });

  final IconData icon;
  final IconData selectedIcon;
  final String label;
  final bool selected;
  final VoidCallback onTap;
  final int badgeCount;

  @override
  Widget build(BuildContext context) {
    final color = selected ? AppColors.primary : AppColors.textSecondary;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(selected ? selectedIcon : icon, color: color, size: 24),
                if (badgeCount > 0)
                  Positioned(
                    right: -6,
                    top: -4,
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                        color: AppColors.error,
                        shape: BoxShape.circle,
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 14,
                        minHeight: 14,
                      ),
                      child: Text(
                        '$badgeCount',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: selected
                  ? AppTextStyles.navLabelSelected
                  : AppTextStyles.navLabel,
            ),
          ],
        ),
      ),
    );
  }
}
