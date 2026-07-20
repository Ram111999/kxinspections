// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'charge.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Charge {

 String get id; String get inspectionId; String get bookingId; String get title; String get description; double get amount; String get currency; ChargeStatus get status; DateTime get dueDate; DateTime? get acceptedAt; DateTime? get contestedAt; DateTime? get paidAt; String? get contestReason; List<String> get photoIds; String? get category;
/// Create a copy of Charge
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChargeCopyWith<Charge> get copyWith => _$ChargeCopyWithImpl<Charge>(this as Charge, _$identity);

  /// Serializes this Charge to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Charge&&(identical(other.id, id) || other.id == id)&&(identical(other.inspectionId, inspectionId) || other.inspectionId == inspectionId)&&(identical(other.bookingId, bookingId) || other.bookingId == bookingId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.status, status) || other.status == status)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.acceptedAt, acceptedAt) || other.acceptedAt == acceptedAt)&&(identical(other.contestedAt, contestedAt) || other.contestedAt == contestedAt)&&(identical(other.paidAt, paidAt) || other.paidAt == paidAt)&&(identical(other.contestReason, contestReason) || other.contestReason == contestReason)&&const DeepCollectionEquality().equals(other.photoIds, photoIds)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,inspectionId,bookingId,title,description,amount,currency,status,dueDate,acceptedAt,contestedAt,paidAt,contestReason,const DeepCollectionEquality().hash(photoIds),category);

@override
String toString() {
  return 'Charge(id: $id, inspectionId: $inspectionId, bookingId: $bookingId, title: $title, description: $description, amount: $amount, currency: $currency, status: $status, dueDate: $dueDate, acceptedAt: $acceptedAt, contestedAt: $contestedAt, paidAt: $paidAt, contestReason: $contestReason, photoIds: $photoIds, category: $category)';
}


}

/// @nodoc
abstract mixin class $ChargeCopyWith<$Res>  {
  factory $ChargeCopyWith(Charge value, $Res Function(Charge) _then) = _$ChargeCopyWithImpl;
@useResult
$Res call({
 String id, String inspectionId, String bookingId, String title, String description, double amount, String currency, ChargeStatus status, DateTime dueDate, DateTime? acceptedAt, DateTime? contestedAt, DateTime? paidAt, String? contestReason, List<String> photoIds, String? category
});




}
/// @nodoc
class _$ChargeCopyWithImpl<$Res>
    implements $ChargeCopyWith<$Res> {
  _$ChargeCopyWithImpl(this._self, this._then);

  final Charge _self;
  final $Res Function(Charge) _then;

/// Create a copy of Charge
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? inspectionId = null,Object? bookingId = null,Object? title = null,Object? description = null,Object? amount = null,Object? currency = null,Object? status = null,Object? dueDate = null,Object? acceptedAt = freezed,Object? contestedAt = freezed,Object? paidAt = freezed,Object? contestReason = freezed,Object? photoIds = null,Object? category = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,inspectionId: null == inspectionId ? _self.inspectionId : inspectionId // ignore: cast_nullable_to_non_nullable
as String,bookingId: null == bookingId ? _self.bookingId : bookingId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ChargeStatus,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime,acceptedAt: freezed == acceptedAt ? _self.acceptedAt : acceptedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,contestedAt: freezed == contestedAt ? _self.contestedAt : contestedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,paidAt: freezed == paidAt ? _self.paidAt : paidAt // ignore: cast_nullable_to_non_nullable
as DateTime?,contestReason: freezed == contestReason ? _self.contestReason : contestReason // ignore: cast_nullable_to_non_nullable
as String?,photoIds: null == photoIds ? _self.photoIds : photoIds // ignore: cast_nullable_to_non_nullable
as List<String>,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Charge].
extension ChargePatterns on Charge {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Charge value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Charge() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Charge value)  $default,){
final _that = this;
switch (_that) {
case _Charge():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Charge value)?  $default,){
final _that = this;
switch (_that) {
case _Charge() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String inspectionId,  String bookingId,  String title,  String description,  double amount,  String currency,  ChargeStatus status,  DateTime dueDate,  DateTime? acceptedAt,  DateTime? contestedAt,  DateTime? paidAt,  String? contestReason,  List<String> photoIds,  String? category)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Charge() when $default != null:
return $default(_that.id,_that.inspectionId,_that.bookingId,_that.title,_that.description,_that.amount,_that.currency,_that.status,_that.dueDate,_that.acceptedAt,_that.contestedAt,_that.paidAt,_that.contestReason,_that.photoIds,_that.category);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String inspectionId,  String bookingId,  String title,  String description,  double amount,  String currency,  ChargeStatus status,  DateTime dueDate,  DateTime? acceptedAt,  DateTime? contestedAt,  DateTime? paidAt,  String? contestReason,  List<String> photoIds,  String? category)  $default,) {final _that = this;
switch (_that) {
case _Charge():
return $default(_that.id,_that.inspectionId,_that.bookingId,_that.title,_that.description,_that.amount,_that.currency,_that.status,_that.dueDate,_that.acceptedAt,_that.contestedAt,_that.paidAt,_that.contestReason,_that.photoIds,_that.category);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String inspectionId,  String bookingId,  String title,  String description,  double amount,  String currency,  ChargeStatus status,  DateTime dueDate,  DateTime? acceptedAt,  DateTime? contestedAt,  DateTime? paidAt,  String? contestReason,  List<String> photoIds,  String? category)?  $default,) {final _that = this;
switch (_that) {
case _Charge() when $default != null:
return $default(_that.id,_that.inspectionId,_that.bookingId,_that.title,_that.description,_that.amount,_that.currency,_that.status,_that.dueDate,_that.acceptedAt,_that.contestedAt,_that.paidAt,_that.contestReason,_that.photoIds,_that.category);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Charge extends Charge {
  const _Charge({required this.id, required this.inspectionId, required this.bookingId, required this.title, required this.description, required this.amount, this.currency = 'GBP', required this.status, required this.dueDate, this.acceptedAt, this.contestedAt, this.paidAt, this.contestReason, final  List<String> photoIds = const [], this.category}): _photoIds = photoIds,super._();
  factory _Charge.fromJson(Map<String, dynamic> json) => _$ChargeFromJson(json);

@override final  String id;
@override final  String inspectionId;
@override final  String bookingId;
@override final  String title;
@override final  String description;
@override final  double amount;
@override@JsonKey() final  String currency;
@override final  ChargeStatus status;
@override final  DateTime dueDate;
@override final  DateTime? acceptedAt;
@override final  DateTime? contestedAt;
@override final  DateTime? paidAt;
@override final  String? contestReason;
 final  List<String> _photoIds;
@override@JsonKey() List<String> get photoIds {
  if (_photoIds is EqualUnmodifiableListView) return _photoIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_photoIds);
}

@override final  String? category;

/// Create a copy of Charge
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChargeCopyWith<_Charge> get copyWith => __$ChargeCopyWithImpl<_Charge>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChargeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Charge&&(identical(other.id, id) || other.id == id)&&(identical(other.inspectionId, inspectionId) || other.inspectionId == inspectionId)&&(identical(other.bookingId, bookingId) || other.bookingId == bookingId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.status, status) || other.status == status)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.acceptedAt, acceptedAt) || other.acceptedAt == acceptedAt)&&(identical(other.contestedAt, contestedAt) || other.contestedAt == contestedAt)&&(identical(other.paidAt, paidAt) || other.paidAt == paidAt)&&(identical(other.contestReason, contestReason) || other.contestReason == contestReason)&&const DeepCollectionEquality().equals(other._photoIds, _photoIds)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,inspectionId,bookingId,title,description,amount,currency,status,dueDate,acceptedAt,contestedAt,paidAt,contestReason,const DeepCollectionEquality().hash(_photoIds),category);

@override
String toString() {
  return 'Charge(id: $id, inspectionId: $inspectionId, bookingId: $bookingId, title: $title, description: $description, amount: $amount, currency: $currency, status: $status, dueDate: $dueDate, acceptedAt: $acceptedAt, contestedAt: $contestedAt, paidAt: $paidAt, contestReason: $contestReason, photoIds: $photoIds, category: $category)';
}


}

/// @nodoc
abstract mixin class _$ChargeCopyWith<$Res> implements $ChargeCopyWith<$Res> {
  factory _$ChargeCopyWith(_Charge value, $Res Function(_Charge) _then) = __$ChargeCopyWithImpl;
@override @useResult
$Res call({
 String id, String inspectionId, String bookingId, String title, String description, double amount, String currency, ChargeStatus status, DateTime dueDate, DateTime? acceptedAt, DateTime? contestedAt, DateTime? paidAt, String? contestReason, List<String> photoIds, String? category
});




}
/// @nodoc
class __$ChargeCopyWithImpl<$Res>
    implements _$ChargeCopyWith<$Res> {
  __$ChargeCopyWithImpl(this._self, this._then);

  final _Charge _self;
  final $Res Function(_Charge) _then;

/// Create a copy of Charge
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? inspectionId = null,Object? bookingId = null,Object? title = null,Object? description = null,Object? amount = null,Object? currency = null,Object? status = null,Object? dueDate = null,Object? acceptedAt = freezed,Object? contestedAt = freezed,Object? paidAt = freezed,Object? contestReason = freezed,Object? photoIds = null,Object? category = freezed,}) {
  return _then(_Charge(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,inspectionId: null == inspectionId ? _self.inspectionId : inspectionId // ignore: cast_nullable_to_non_nullable
as String,bookingId: null == bookingId ? _self.bookingId : bookingId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ChargeStatus,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime,acceptedAt: freezed == acceptedAt ? _self.acceptedAt : acceptedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,contestedAt: freezed == contestedAt ? _self.contestedAt : contestedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,paidAt: freezed == paidAt ? _self.paidAt : paidAt // ignore: cast_nullable_to_non_nullable
as DateTime?,contestReason: freezed == contestReason ? _self.contestReason : contestReason // ignore: cast_nullable_to_non_nullable
as String?,photoIds: null == photoIds ? _self._photoIds : photoIds // ignore: cast_nullable_to_non_nullable
as List<String>,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
