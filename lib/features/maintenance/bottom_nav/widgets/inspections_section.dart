import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/status_chip.dart';
import '../../shared/models/maintenance_models.dart';
import 'maintenance_section_title.dart';

/// "Inspections" section: section title + one card per inspection
/// (e.g. "Pre-Arrival"). Cards are tappable when the inspection has
/// an id that can be resolved to a details screen.
class InspectionsSection extends StatelessWidget {
  const InspectionsSection({
    super.key,
    required this.records,
    this.onTapInspection,
  });

  final List<InspectionRecord> records;
  final ValueChanged<InspectionRecord>? onTapInspection;

  @override
  Widget build(BuildContext context) {
    if (records.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MaintenanceSectionTitle('Inspections'),
        for (final record in records) ...[
          _InspectionCard(record: record, onTap: onTapInspection),
          const SizedBox(height: 10),
        ],
      ],
    );
  }
}

class _InspectionCard extends StatelessWidget {
  const _InspectionCard({required this.record, this.onTap});

  final InspectionRecord record;
  final ValueChanged<InspectionRecord>? onTap;

  @override
  Widget build(BuildContext context) {
    final bool tappable = record.id.isNotEmpty && onTap != null;

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: tappable ? () => onTap!(record) : null,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(record.type, style: AppTextStyles.cardTitle),
                StatusChip(label: record.status),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(
                  Icons.place_outlined,
                  size: 15,
                  color: AppColors.textSecondary,
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(record.location, style: AppTextStyles.bodySmall),
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
                Text(record.dateLabel, style: AppTextStyles.bodySmall),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
