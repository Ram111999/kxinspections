import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../shared/models/maintenance_models.dart';
import 'maintenance_section_title.dart';
import 'task_card.dart';

/// "Open Tasks" section: title, full-width "Raise Task" button, and
/// a vertical list of [TaskCard]s.
class OpenTasksSection extends StatelessWidget {
  const OpenTasksSection({
    super.key,
    required this.tasks,
    required this.onRaiseTask,
    this.onTapTask,
  });

  final List<MaintenanceTask> tasks;
  final VoidCallback onRaiseTask;
  final ValueChanged<MaintenanceTask>? onTapTask;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MaintenanceSectionTitle('Open Tasks'),
        SizedBox(
          width: double.infinity,
          height: 46,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            onPressed: onRaiseTask,
            child: const Text('Raise Task', style: AppTextStyles.buttonLabel),
          ),
        ),
        const SizedBox(height: 14),
        if (tasks.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              'No open tasks for this booking.',
              style: AppTextStyles.bodyMedium,
            ),
          )
        else
          for (final task in tasks) ...[
            TaskCard(task: task, onTap: onTapTask),
            const SizedBox(height: 10),
          ],
      ],
    );
  }
}
