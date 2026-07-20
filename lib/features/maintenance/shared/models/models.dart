import 'charge_status.dart';

export 'booking.dart';
export 'charge.dart';
export 'charge_status.dart';
export 'inspection.dart';
export 'inventory.dart';
export 'photo.dart';
export 'task.dart';

/// Hive persistence overlay for charge state mutated locally.
///
/// Kept separate from [Charge] so JSON fixtures remain immutable while
/// user actions persist across sessions.
class ChargePersistence {
  const ChargePersistence({
    required this.chargeId,
    required this.status,
    this.contestReason,
    this.acceptedAt,
    this.contestedAt,
    this.paidAt,
    this.updatedAt,
  });

  final String chargeId;
  final ChargeStatus status;
  final String? contestReason;
  final DateTime? acceptedAt;
  final DateTime? contestedAt;
  final DateTime? paidAt;
  final DateTime? updatedAt;

  Map<String, dynamic> toMap() => {
        'charge_id': chargeId,
        'status': status.name,
        'contest_reason': contestReason,
        'accepted_at': acceptedAt?.toIso8601String(),
        'contested_at': contestedAt?.toIso8601String(),
        'paid_at': paidAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  factory ChargePersistence.fromMap(Map<dynamic, dynamic> map) {
    return ChargePersistence(
      chargeId: map['charge_id'] as String,
      status: ChargeStatus.values.byName(map['status'] as String),
      contestReason: map['contest_reason'] as String?,
      acceptedAt: map['accepted_at'] != null
          ? DateTime.parse(map['accepted_at'] as String)
          : null,
      contestedAt: map['contested_at'] != null
          ? DateTime.parse(map['contested_at'] as String)
          : null,
      paidAt: map['paid_at'] != null
          ? DateTime.parse(map['paid_at'] as String)
          : null,
      updatedAt: map['updated_at'] != null
          ? DateTime.parse(map['updated_at'] as String)
          : null,
    );
  }
}
