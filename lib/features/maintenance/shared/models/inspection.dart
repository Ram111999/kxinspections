import 'package:freezed_annotation/freezed_annotation.dart';

part 'inspection.freezed.dart';
part 'inspection.g.dart';

enum InspectionStatus {
  scheduled,
  inProgress,
  completed,
}

enum InspectionType {
  checkIn,
  checkOut,
  interim,
  maintenance,
}

@freezed
abstract class Inspection with _$Inspection {
  const factory Inspection({
    required String id,
    required String bookingId,
    required InspectionType type,
    required InspectionStatus status,
    required DateTime scheduledDate,
    DateTime? completedDate,
    @Default([]) List<String> taskIds,
    @Default([]) List<String> chargeIds,
    @Default([]) List<String> photoIds,
    String? summary,
    String? inspectorName,
  }) = _Inspection;

  factory Inspection.fromJson(Map<String, dynamic> json) =>
      _$InspectionFromJson(json);
}
