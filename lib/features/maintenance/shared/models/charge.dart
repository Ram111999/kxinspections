import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kxinspections/features/maintenance/shared/models/charge_status.dart';

part 'charge.freezed.dart';
part 'charge.g.dart';

@freezed
abstract class Charge with _$Charge {
  const Charge._();

  const factory Charge({
    required String id,
    required String inspectionId,
    required String bookingId,
    required String title,
    required String description,
    required double amount,
    @Default('GBP') String currency,
    required ChargeStatus status,
    required DateTime dueDate,
    DateTime? acceptedAt,
    DateTime? contestedAt,
    DateTime? paidAt,
    String? contestReason,
    @Default([]) List<String> photoIds,
    String? category,
  }) = _Charge;

  factory Charge.fromJson(Map<String, dynamic> json) => _$ChargeFromJson(json);

  /// Days remaining until the contest / payment deadline (negative if overdue).
  int daysUntilDue({DateTime? from}) {
    final reference = from ?? DateTime.now();
    final dueDay = DateTime(dueDate.year, dueDate.month, dueDate.day);
    final today = DateTime(reference.year, reference.month, reference.day);
    return dueDay.difference(today).inDays;
  }

  bool get isOverdue => daysUntilDue() < 0;

  bool get canAccept => status == ChargeStatus.outstanding;

  bool get canContest => status == ChargeStatus.outstanding;

  bool get canMarkPaid =>
      status == ChargeStatus.accepted || status == ChargeStatus.contested;
}
