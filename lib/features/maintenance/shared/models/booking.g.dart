// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Booking _$BookingFromJson(Map<String, dynamic> json) => _Booking(
  id: json['id'] as String,
  propertyAddress: json['property_address'] as String,
  tenantName: json['tenant_name'] as String,
  checkInDate: DateTime.parse(json['check_in_date'] as String),
  checkOutDate: DateTime.parse(json['check_out_date'] as String),
  unitNumber: json['unit_number'] as String?,
  landlordName: json['landlord_name'] as String?,
);

Map<String, dynamic> _$BookingToJson(_Booking instance) => <String, dynamic>{
  'id': instance.id,
  'property_address': instance.propertyAddress,
  'tenant_name': instance.tenantName,
  'check_in_date': instance.checkInDate.toIso8601String(),
  'check_out_date': instance.checkOutDate.toIso8601String(),
  'unit_number': ?instance.unitNumber,
  'landlord_name': ?instance.landlordName,
};
