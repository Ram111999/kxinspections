import 'package:freezed_annotation/freezed_annotation.dart';

part 'inventory.freezed.dart';
part 'inventory.g.dart';

enum InventoryCondition {
  excellent,
  good,
  fair,
  poor,
  damaged,
}

@freezed
abstract class InventoryItem with _$InventoryItem {
  const factory InventoryItem({
    required String id,
    required String inspectionId,
    required String itemName,
    required String room,
    required InventoryCondition condition,
    String? notes,
    @Default([]) List<String> photoIds,
    double? replacementCost,
  }) = _InventoryItem;

  factory InventoryItem.fromJson(Map<String, dynamic> json) =>
      _$InventoryItemFromJson(json);
}
