import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/status_chip.dart';
import '../../shared/models/maintenance_models.dart';
import 'maintenance_section_title.dart';

/// "Inventory" section: section title + "My Inventory" card(s).
class InventorySection extends StatelessWidget {
  const InventorySection({
    super.key,
    required this.records,
    required this.onViewReport,
  });

  final List<InventoryRecord> records;
  final ValueChanged<InventoryRecord> onViewReport;

  @override
  Widget build(BuildContext context) {
    if (records.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MaintenanceSectionTitle('Inventory'),
        for (final record in records) ...[
          _InventoryCard(record: record, onViewReport: onViewReport),
          const SizedBox(height: 10),
        ],
      ],
    );
  }
}

class _InventoryCard extends StatelessWidget {
  const _InventoryCard({required this.record, required this.onViewReport});

  final InventoryRecord record;
  final ValueChanged<InventoryRecord> onViewReport;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              Text(record.title, style: AppTextStyles.cardTitle),
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
          if (record.reportUrl != null) ...[
            const SizedBox(height: 8),
            InkWell(
              onTap: () => onViewReport(record),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.description_outlined,
                    size: 14,
                    color: AppColors.info,
                  ),
                  const SizedBox(width: 6),
                  Text('View report', style: AppTextStyles.linkButton),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
