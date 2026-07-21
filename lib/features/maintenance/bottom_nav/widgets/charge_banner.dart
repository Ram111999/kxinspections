import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../shared/models/maintenance_models.dart';

class ChargeBanner extends StatelessWidget {
  const ChargeBanner({
    super.key,
    required this.charge,
    required this.onView,
    required this.onPay,
  });

  final MaintenanceCharge charge;
  final VoidCallback onView;
  final VoidCallback onPay;

  @override
  Widget build(BuildContext context) {
    final bool isAccepted = charge.isAccepted;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.bannerBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isAccepted ? AppColors.success : AppColors.info,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            isAccepted ? Icons.check_circle_outline : Icons.info_outline,
            size: 20,
            color: isAccepted ? AppColors.success : AppColors.bannerIcon,
          ),
          const SizedBox(width: 10),

          Expanded(
            child: RichText(
              text: TextSpan(
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textPrimary,
                  height: 1.35,
                ),
                children: [
                  TextSpan(
                    text: charge.isAccepted
                        ? 'Thank you for accepting this charge. Please go to your statement to pay.'
                        : 'A charge has been added to your account. Please review and pay this by',
                  ),
                  if (!charge.isAccepted) ...[
                    const TextSpan(text: ' '),
                    TextSpan(
                      text: charge.deadlineLabel,
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ],
                ],
                //   if (!isAccepted) ...[
                //     const TextSpan(text: ' '),
                //     TextSpan(
                //       text: charge.deadlineLabel,
                //       style: const TextStyle(fontWeight: FontWeight.w700),
                //     ),
                //   ],
                // ],
              ),
            ),
          ),

          const SizedBox(width: 8),

          TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: isAccepted ? onPay : onView,
            child: Text(
              isAccepted ? 'Pay' : 'View',
              style: AppTextStyles.linkButton,
            ),
          ),
        ],
      ),
    );
  }
}
