import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking.freezed.dart';
part 'booking.g.dart';

@freezed
abstract class Booking with _$Booking {
  const factory Booking({
    required String id,
    required String propertyAddress,
    required String tenantName,
    required DateTime checkInDate,
    required DateTime checkOutDate,
    String? unitNumber,
    String? landlordName,
  }) = _Booking;

  factory Booking.fromJson(Map<String, dynamic> json) => _$BookingFromJson(json);
}
