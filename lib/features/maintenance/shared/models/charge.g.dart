// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'charge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Charge _$ChargeFromJson(Map<String, dynamic> json) => _Charge(
  id: json['id'] as String,
  inspectionId: json['inspection_id'] as String,
  bookingId: json['booking_id'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  amount: (json['amount'] as num).toDouble(),
  currency: json['currency'] as String? ?? 'GBP',
  status: $enumDecode(_$ChargeStatusEnumMap, json['status']),
  dueDate: DateTime.parse(json['due_date'] as String),
  acceptedAt: json['accepted_at'] == null
      ? null
      : DateTime.parse(json['accepted_at'] as String),
  contestedAt: json['contested_at'] == null
      ? null
      : DateTime.parse(json['contested_at'] as String),
  paidAt: json['paid_at'] == null
      ? null
      : DateTime.parse(json['paid_at'] as String),
  contestReason: json['contest_reason'] as String?,
  photoIds:
      (json['photo_ids'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  category: json['category'] as String?,
);

Map<String, dynamic> _$ChargeToJson(_Charge instance) => <String, dynamic>{
  'id': instance.id,
  'inspection_id': instance.inspectionId,
  'booking_id': instance.bookingId,
  'title': instance.title,
  'description': instance.description,
  'amount': instance.amount,
  'currency': instance.currency,
  'status': _$ChargeStatusEnumMap[instance.status]!,
  'due_date': instance.dueDate.toIso8601String(),
  'accepted_at': ?instance.acceptedAt?.toIso8601String(),
  'contested_at': ?instance.contestedAt?.toIso8601String(),
  'paid_at': ?instance.paidAt?.toIso8601String(),
  'contest_reason': ?instance.contestReason,
  'photo_ids': instance.photoIds,
  'category': ?instance.category,
};

const _$ChargeStatusEnumMap = {
  ChargeStatus.outstanding: 'outstanding',
  ChargeStatus.accepted: 'accepted',
  ChargeStatus.contested: 'contested',
  ChargeStatus.paid: 'paid',
};
