// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Task _$TaskFromJson(Map<String, dynamic> json) => _Task(
  id: json['id'] as String,
  inspectionId: json['inspection_id'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  room: json['room'] as String,
  status: $enumDecode(_$TaskStatusEnumMap, json['status']),
  priority:
      $enumDecodeNullable(_$TaskPriorityEnumMap, json['priority']) ??
      TaskPriority.medium,
  photoIds:
      (json['photo_ids'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  dueDate: json['due_date'] == null
      ? null
      : DateTime.parse(json['due_date'] as String),
);

Map<String, dynamic> _$TaskToJson(_Task instance) => <String, dynamic>{
  'id': instance.id,
  'inspection_id': instance.inspectionId,
  'title': instance.title,
  'description': instance.description,
  'room': instance.room,
  'status': _$TaskStatusEnumMap[instance.status]!,
  'priority': _$TaskPriorityEnumMap[instance.priority]!,
  'photo_ids': instance.photoIds,
  'due_date': ?instance.dueDate?.toIso8601String(),
};

const _$TaskStatusEnumMap = {
  TaskStatus.pending: 'pending',
  TaskStatus.inProgress: 'inProgress',
  TaskStatus.completed: 'completed',
};

const _$TaskPriorityEnumMap = {
  TaskPriority.low: 'low',
  TaskPriority.medium: 'medium',
  TaskPriority.high: 'high',
};
