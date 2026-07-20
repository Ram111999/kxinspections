// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inspection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Inspection _$InspectionFromJson(Map<String, dynamic> json) => _Inspection(
  id: json['id'] as String,
  bookingId: json['booking_id'] as String,
  type: $enumDecode(_$InspectionTypeEnumMap, json['type']),
  status: $enumDecode(_$InspectionStatusEnumMap, json['status']),
  scheduledDate: DateTime.parse(json['scheduled_date'] as String),
  completedDate: json['completed_date'] == null
      ? null
      : DateTime.parse(json['completed_date'] as String),
  taskIds:
      (json['task_ids'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  chargeIds:
      (json['charge_ids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  photoIds:
      (json['photo_ids'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  summary: json['summary'] as String?,
  inspectorName: json['inspector_name'] as String?,
);

Map<String, dynamic> _$InspectionToJson(_Inspection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'booking_id': instance.bookingId,
      'type': _$InspectionTypeEnumMap[instance.type]!,
      'status': _$InspectionStatusEnumMap[instance.status]!,
      'scheduled_date': instance.scheduledDate.toIso8601String(),
      'completed_date': ?instance.completedDate?.toIso8601String(),
      'task_ids': instance.taskIds,
      'charge_ids': instance.chargeIds,
      'photo_ids': instance.photoIds,
      'summary': ?instance.summary,
      'inspector_name': ?instance.inspectorName,
    };

const _$InspectionTypeEnumMap = {
  InspectionType.checkIn: 'checkIn',
  InspectionType.checkOut: 'checkOut',
  InspectionType.interim: 'interim',
  InspectionType.maintenance: 'maintenance',
};

const _$InspectionStatusEnumMap = {
  InspectionStatus.scheduled: 'scheduled',
  InspectionStatus.inProgress: 'inProgress',
  InspectionStatus.completed: 'completed',
};
