/// Centralized user-facing copy. Avoid hardcoded strings in widgets.
abstract final class AppStrings {
  static const appTitle = 'KxInspections';

  // Navigation
  static const maintenanceHub = 'Maintenance Hub';
  static const viewInspection = 'View Inspection';
  static const viewCharge = 'Charge';
  static const contestCharge = 'Contest Charge';

  // Charge actions
  static const acceptCharge = 'Accept Charge';
  static const contestChargeAction = 'Contest Charge';
  static const markAsPaid = 'Mark as Paid';

  // Charge status labels
  static const statusOutstanding = 'Outstanding';
  static const statusAccepted = 'Accepted';
  static const statusContested = 'Contested';
  static const statusPaid = 'Paid';

  // Validation
  static const contestReasonRequired =
      'Please provide a reason for contesting.';
  static const contestReasonMinLength =
      'Reason must be at least 10 characters.';

  // Errors
  static const genericError = 'Something went wrong. Please try again.';
  static const chargeNotFound = 'Charge not found.';
  static const inspectionNotFound = 'Inspection not found.';
}
