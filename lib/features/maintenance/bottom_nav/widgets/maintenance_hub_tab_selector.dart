import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../provider/maintenance_provider.dart';

/// Open / History icon+label tab selector shown at the top of the
/// Maintenance Hub screen.
class MaintenanceHubTabSelector extends StatelessWidget {
  const MaintenanceHubTabSelector({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  final MaintenanceHubTab selected;
  final ValueChanged<MaintenanceHubTab> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _TabButton(
          icon: Icons.assignment_outlined,
          label: 'Open',
          selected: selected == MaintenanceHubTab.open,
          onTap: () => onChanged(MaintenanceHubTab.open),
        ),
        const SizedBox(width: 10),
        _TabButton(
          icon: Icons.history,
          label: 'History',
          selected: selected == MaintenanceHubTab.history,
          onTap: () => onChanged(MaintenanceHubTab.history),
        ),
      ],
    );
  }
}

class _TabButton extends StatelessWidget {
  const _TabButton({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 44,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: selected ? AppColors.primary : AppColors.cardMuted,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              size: 20,
              color: selected ? Colors.white : AppColors.textSecondary,
            ),
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
    );
  }
}
