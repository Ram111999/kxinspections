// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InventoryItem _$InventoryItemFromJson(Map<String, dynamic> json) =>
    _InventoryItem(
      id: json['id'] as String,
      inspectionId: json['inspection_id'] as String,
      itemName: json['item_name'] as String,
      room: json['room'] as String,
      condition: $enumDecode(_$InventoryConditionEnumMap, json['condition']),
      notes: json['notes'] as String?,
      photoIds:
          (json['photo_ids'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      replacementCost: (json['replacement_cost'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$InventoryItemToJson(_InventoryItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'inspection_id': instance.inspectionId,
      'item_name': instance.itemName,
      'room': instance.room,
      'condition': _$InventoryConditionEnumMap[instance.condition]!,
      'notes': ?instance.notes,
      'photo_ids': instance.photoIds,
      'replacement_cost': ?instance.replacementCost,
    };

const _$InventoryConditionEnumMap = {
  InventoryCondition.excellent: 'excellent',
  InventoryCondition.good: 'good',
  InventoryCondition.fair: 'fair',
  InventoryCondition.poor: 'poor',
  InventoryCondition.damaged: 'damaged',
};
