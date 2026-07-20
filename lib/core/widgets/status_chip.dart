import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';

/// A small dot + label chip used for statuses such as
/// Completed, New, Outstanding, In Progress, Accepted, Contested, Paid.
class StatusChip extends StatelessWidget {
  const StatusChip({super.key, required this.label, this.color});

  final String label;

  /// Optional explicit color override. Falls back to
  /// [AppColors.forStatusLabel] based on [label].
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final Color dotColor = color ?? AppColors.forStatusLabel(label);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 7,
          height: 7,
          decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        Text(label, style: AppTextStyles.statusChip.copyWith(color: dotColor)),
      ],
    );
  }
}
