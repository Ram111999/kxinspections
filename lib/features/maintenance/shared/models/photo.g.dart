// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Photo _$PhotoFromJson(Map<String, dynamic> json) => _Photo(
  id: json['id'] as String,
  url: json['url'] as String,
  caption: json['caption'] as String?,
  takenAt: DateTime.parse(json['taken_at'] as String),
);

Map<String, dynamic> _$PhotoToJson(_Photo instance) => <String, dynamic>{
  'id': instance.id,
  'url': instance.url,
  'caption': ?instance.caption,
  'taken_at': instance.takenAt.toIso8601String(),
};
