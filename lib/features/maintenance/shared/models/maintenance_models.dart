import 'package:flutter/material.dart';

/// A booking a student can be assigned to (used to populate the
/// booking dropdown selector at the top of the Maintenance Hub).
class MaintenanceBooking {
  const MaintenanceBooking({
    required this.id,
    required this.startDate,
    required this.endDate,
    required this.unitCode,
  });

  final String id;
  final DateTime startDate;
  final DateTime endDate;
  final String unitCode;

  static String _fmt(DateTime d) =>
      '${d.month.toString().padLeft(2, '0')}/${d.day.toString().padLeft(2, '0')}/${d.year}';

  /// e.g. "09/01/2025 > 09/30/2025 - OVA111"
  String get label => '${_fmt(startDate)} > ${_fmt(endDate)} - $unitCode';
}

/// Outstanding charge shown as a banner under the booking selector.
class MaintenanceCharge {
  const MaintenanceCharge({
    required this.message,
    required this.deadline,
    required this.isAccepted,
  });

  final String message;
  final DateTime deadline;
  final bool isAccepted;

  String get deadlineLabel =>
      '${deadline.day.toString().padLeft(2, '0')}/${deadline.month.toString().padLeft(2, '0')}/${deadline.year}';

  MaintenanceCharge copyWith({
    String? message,
    DateTime? deadline,
    bool? isAccepted,
  }) {
    return MaintenanceCharge(
      message: message ?? this.message,
      deadline: deadline ?? this.deadline,
      isAccepted: isAccepted ?? this.isAccepted,
    );
  }
}

/// A single inventory record shown in the "Inventory" section
/// (e.g. the "My Inventory" card).
class InventoryRecord {
  const InventoryRecord({
    required this.title,
    required this.location,
    required this.date,
    required this.status,
    this.reportUrl,
  });

  final String title;
  final String location;
  final DateTime date;
  final String status; // e.g. "Completed"
  final String? reportUrl;

  String get dateLabel =>
      '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
}

/// A single inspection record shown in the "Inspections" section
/// (e.g. "Pre-Arrival").
class InspectionRecord {
  const InspectionRecord({
    required this.id,
    required this.type,
    required this.location,
    required this.date,
    required this.status,
  });

  final String id;
  final String type; // e.g. "Pre-Arrival"
  final String location;
  final DateTime date;
  final String status; // e.g. "Completed"

  String get dateLabel =>
      '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
}

/// Status of an open maintenance task.
enum MaintenanceTaskStatus { newTask, outstanding, inProgress, accepted }

extension MaintenanceTaskStatusX on MaintenanceTaskStatus {
  String get label {
    switch (this) {
      case MaintenanceTaskStatus.newTask:
        return 'New';
      case MaintenanceTaskStatus.outstanding:
        return 'Outstanding';
      case MaintenanceTaskStatus.inProgress:
        return 'In Progress';
      case MaintenanceTaskStatus.accepted:
        return 'Accepted';
    }
  }
}

/// A maintenance task card shown under "Open Tasks".
class MaintenanceTask {
  const MaintenanceTask({
    required this.id,
    required this.title,
    required this.category,
    required this.categoryIcon,
    required this.notes,
    required this.location,
    required this.date,
    required this.status,
    required this.images,
    this.amount,
  });

  /// Full identifier, e.g. "TCK57" (rendered as "Task ID: #TCK57").
  final String id;

  /// Card top-row title. Usually "Task ID: #<id>", but charge-driven
  /// tasks (e.g. a furniture replacement) may show a short label
  /// like "Replace" instead — set this directly to match the source
  /// of truth from the repository/API.
  final String title;

  final String category; // e.g. "Wardrobe"
  final IconData categoryIcon;
  final String notes; // e.g. "Doors are hanging off"
  final String location;
  final DateTime date;
  final MaintenanceTaskStatus status;
  final List<String> images;

  /// Only present for charge-generating tasks (e.g. Replace).
  final double? amount;

  String get dateLabel =>
      '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';

  String get amountLabel =>
      amount == null ? '' : '£${amount!.toStringAsFixed(2)}';
}

/// Final status of a historical charge shown on the History tab.
enum ChargeHistoryStatus { accepted, contested, paid }

extension ChargeHistoryStatusX on ChargeHistoryStatus {
  String get label {
    switch (this) {
      case ChargeHistoryStatus.accepted:
        return 'Accepted';
      case ChargeHistoryStatus.contested:
        return 'Contested';
      case ChargeHistoryStatus.paid:
        return 'Paid';
    }
  }
}

/// A single row on the History tab.
class ChargeHistoryRecord {
  const ChargeHistoryRecord({
    required this.title,
    required this.amount,
    required this.date,
    required this.status,
  });

  final String title; // charge type/item
  final double amount;
  final DateTime date;
  final ChargeHistoryStatus status;

  String get amountLabel => '£${amount.toStringAsFixed(2)}';

  String get dateLabel =>
      '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
}
