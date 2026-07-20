import 'package:flutter/material.dart';
import 'package:kxinspections/core/constants/app_strings.dart';
import 'package:kxinspections/core/theme/app_colors.dart';

/// Lifecycle states for a maintenance charge.
enum ChargeStatus {
  outstanding,
  accepted,
  contested,
  paid;

  String get label => switch (this) {
        ChargeStatus.outstanding => AppStrings.statusOutstanding,
        ChargeStatus.accepted => AppStrings.statusAccepted,
        ChargeStatus.contested => AppStrings.statusContested,
        ChargeStatus.paid => AppStrings.statusPaid,
      };

  Color get color => switch (this) {
        ChargeStatus.outstanding => AppColors.outstanding,
        ChargeStatus.accepted => AppColors.accepted,
        ChargeStatus.contested => AppColors.contested,
        ChargeStatus.paid => AppColors.paid,
      };

  /// Valid transitions enforced by repository / provider logic.
  bool canTransitionTo(ChargeStatus next) => switch (this) {
        ChargeStatus.outstanding =>
          next == ChargeStatus.accepted || next == ChargeStatus.contested,
        ChargeStatus.contested => next == ChargeStatus.paid,
        ChargeStatus.accepted => next == ChargeStatus.paid,
        ChargeStatus.paid => false,
      };
}
