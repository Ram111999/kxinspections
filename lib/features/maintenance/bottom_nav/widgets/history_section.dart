import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/status_chip.dart';
import '../../shared/models/maintenance_models.dart';

/// History tab body: a list of historical charges with their final
/// status (Accepted, Contested, Paid), amount and date.
class HistorySection extends StatelessWidget {
  const HistorySection({super.key, required this.records});

  final List<ChargeHistoryRecord> records;

  @override
  Widget build(BuildContext context) {
    if (records.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Center(
          child: Text(
            'No charge history yet.',
            style: AppTextStyles.bodyMedium,
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final record in records) ...[
          _HistoryCard(record: record),
          const SizedBox(height: 10),
        ],
      ],
    );
  }
}

class _HistoryCard extends StatelessWidget {
  const _HistoryCard({required this.record});

  final ChargeHistoryRecord record;

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
              Expanded(
                child: Text(record.title, style: AppTextStyles.cardTitle),
              ),
              Text(record.amountLabel, style: AppTextStyles.cardTitle),
            ],
          ),
          const SizedBox(height: 8),
          StatusChip(label: record.status.label),
          const SizedBox(height: 6),
          Text(record.dateLabel, style: AppTextStyles.bodySmall),
        ],
      ),
    );
  }
}
