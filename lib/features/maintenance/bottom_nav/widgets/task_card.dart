import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/status_chip.dart';
import '../../shared/models/maintenance_models.dart';

/// Card for a single maintenance task under "Open Tasks".
class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.task, this.onTap});

  final MaintenanceTask task;
  final ValueChanged<MaintenanceTask>? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap == null ? null : () => onTap!(task),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.cardMuted,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(task.title, style: AppTextStyles.cardTitle),
                ),
                StatusChip(label: task.status.label),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  task.categoryIcon,
                  size: 15,
                  color: AppColors.textSecondary,
                ),
                const SizedBox(width: 6),
                Text(task.category, style: AppTextStyles.bodySmall),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                const Icon(
                  Icons.sticky_note_2_outlined,
                  size: 15,
                  color: AppColors.textSecondary,
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(task.notes, style: AppTextStyles.bodySmall),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                const Icon(
                  Icons.place_outlined,
                  size: 15,
                  color: AppColors.textSecondary,
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(task.location, style: AppTextStyles.bodySmall),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                const Icon(
                  Icons.calendar_today_outlined,
                  size: 14,
                  color: AppColors.textSecondary,
                ),
                const SizedBox(width: 6),
                Text(task.dateLabel, style: AppTextStyles.bodySmall),
              ],
            ),
            if (task.amount != null) ...[
              const SizedBox(height: 6),
              Row(
                children: [
                  const Icon(
                    Icons.currency_pound,
                    size: 14,
                    color: AppColors.textSecondary,
                  ),
                  const SizedBox(width: 6),
                  Text(task.amountLabel, style: AppTextStyles.bodySmall),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
