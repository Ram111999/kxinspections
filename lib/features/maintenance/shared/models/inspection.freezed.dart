// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inspection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Inspection {

 String get id; String get bookingId; InspectionType get type; InspectionStatus get status; DateTime get scheduledDate; DateTime? get completedDate; List<String> get taskIds; List<String> get chargeIds; List<String> get photoIds; String? get summary; String? get inspectorName;
/// Create a copy of Inspection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InspectionCopyWith<Inspection> get copyWith => _$InspectionCopyWithImpl<Inspection>(this as Inspection, _$identity);

  /// Serializes this Inspection to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Inspection&&(identical(other.id, id) || other.id == id)&&(identical(other.bookingId, bookingId) || other.bookingId == bookingId)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.scheduledDate, scheduledDate) || other.scheduledDate == scheduledDate)&&(identical(other.completedDate, completedDate) || other.completedDate == completedDate)&&const DeepCollectionEquality().equals(other.taskIds, taskIds)&&const DeepCollectionEquality().equals(other.chargeIds, chargeIds)&&const DeepCollectionEquality().equals(other.photoIds, photoIds)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.inspectorName, inspectorName) || other.inspectorName == inspectorName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,bookingId,type,status,scheduledDate,completedDate,const DeepCollectionEquality().hash(taskIds),const DeepCollectionEquality().hash(chargeIds),const DeepCollectionEquality().hash(photoIds),summary,inspectorName);

@override
String toString() {
  return 'Inspection(id: $id, bookingId: $bookingId, type: $type, status: $status, scheduledDate: $scheduledDate, completedDate: $completedDate, taskIds: $taskIds, chargeIds: $chargeIds, photoIds: $photoIds, summary: $summary, inspectorName: $inspectorName)';
}


}

/// @nodoc
abstract mixin class $InspectionCopyWith<$Res>  {
  factory $InspectionCopyWith(Inspection value, $Res Function(Inspection) _then) = _$InspectionCopyWithImpl;
@useResult
$Res call({
 String id, String bookingId, InspectionType type, InspectionStatus status, DateTime scheduledDate, DateTime? completedDate, List<String> taskIds, List<String> chargeIds, List<String> photoIds, String? summary, String? inspectorName
});




}
/// @nodoc
class _$InspectionCopyWithImpl<$Res>
    implements $InspectionCopyWith<$Res> {
  _$InspectionCopyWithImpl(this._self, this._then);

  final Inspection _self;
  final $Res Function(Inspection) _then;

/// Create a copy of Inspection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? bookingId = null,Object? type = null,Object? status = null,Object? scheduledDate = null,Object? completedDate = freezed,Object? taskIds = null,Object? chargeIds = null,Object? photoIds = null,Object? summary = freezed,Object? inspectorName = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,bookingId: null == bookingId ? _self.bookingId : bookingId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as InspectionType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as InspectionStatus,scheduledDate: null == scheduledDate ? _self.scheduledDate : scheduledDate // ignore: cast_nullable_to_non_nullable
as DateTime,completedDate: freezed == completedDate ? _self.completedDate : completedDate // ignore: cast_nullable_to_non_nullable
as DateTime?,taskIds: null == taskIds ? _self.taskIds : taskIds // ignore: cast_nullable_to_non_nullable
as List<String>,chargeIds: null == chargeIds ? _self.chargeIds : chargeIds // ignore: cast_nullable_to_non_nullable
as List<String>,photoIds: null == photoIds ? _self.photoIds : photoIds // ignore: cast_nullable_to_non_nullable
as List<String>,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String?,inspectorName: freezed == inspectorName ? _self.inspectorName : inspectorName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Inspection].
extension InspectionPatterns on Inspection {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Inspection value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Inspection() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Inspection value)  $default,){
final _that = this;
switch (_that) {
case _Inspection():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Inspection value)?  $default,){
final _that = this;
switch (_that) {
case _Inspection() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String bookingId,  InspectionType type,  InspectionStatus status,  DateTime scheduledDate,  DateTime? completedDate,  List<String> taskIds,  List<String> chargeIds,  List<String> photoIds,  String? summary,  String? inspectorName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Inspection() when $default != null:
return $default(_that.id,_that.bookingId,_that.type,_that.status,_that.scheduledDate,_that.completedDate,_that.taskIds,_that.chargeIds,_that.photoIds,_that.summary,_that.inspectorName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String bookingId,  InspectionType type,  InspectionStatus status,  DateTime scheduledDate,  DateTime? completedDate,  List<String> taskIds,  List<String> chargeIds,  List<String> photoIds,  String? summary,  String? inspectorName)  $default,) {final _that = this;
switch (_that) {
case _Inspection():
return $default(_that.id,_that.bookingId,_that.type,_that.status,_that.scheduledDate,_that.completedDate,_that.taskIds,_that.chargeIds,_that.photoIds,_that.summary,_that.inspectorName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String bookingId,  InspectionType type,  InspectionStatus status,  DateTime scheduledDate,  DateTime? completedDate,  List<String> taskIds,  List<String> chargeIds,  List<String> photoIds,  String? summary,  String? inspectorName)?  $default,) {final _that = this;
switch (_that) {
case _Inspection() when $default != null:
return $default(_that.id,_that.bookingId,_that.type,_that.status,_that.scheduledDate,_that.completedDate,_that.taskIds,_that.chargeIds,_that.photoIds,_that.summary,_that.inspectorName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Inspection implements Inspection {
  const _Inspection({required this.id, required this.bookingId, required this.type, required this.status, required this.scheduledDate, this.completedDate, final  List<String> taskIds = const [], final  List<String> chargeIds = const [], final  List<String> photoIds = const [], this.summary, this.inspectorName}): _taskIds = taskIds,_chargeIds = chargeIds,_photoIds = photoIds;
  factory _Inspection.fromJson(Map<String, dynamic> json) => _$InspectionFromJson(json);

@override final  String id;
@override final  String bookingId;
@override final  InspectionType type;
@override final  InspectionStatus status;
@override final  DateTime scheduledDate;
@override final  DateTime? completedDate;
 final  List<String> _taskIds;
@override@JsonKey() List<String> get taskIds {
  if (_taskIds is EqualUnmodifiableListView) return _taskIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_taskIds);
}

 final  List<String> _chargeIds;
@override@JsonKey() List<String> get chargeIds {
  if (_chargeIds is EqualUnmodifiableListView) return _chargeIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_chargeIds);
}

 final  List<String> _photoIds;
@override@JsonKey() List<String> get photoIds {
  if (_photoIds is EqualUnmodifiableListView) return _photoIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_photoIds);
}

@override final  String? summary;
@override final  String? inspectorName;

/// Create a copy of Inspection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InspectionCopyWith<_Inspection> get copyWith => __$InspectionCopyWithImpl<_Inspection>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InspectionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Inspection&&(identical(other.id, id) || other.id == id)&&(identical(other.bookingId, bookingId) || other.bookingId == bookingId)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.scheduledDate, scheduledDate) || other.scheduledDate == scheduledDate)&&(identical(other.completedDate, completedDate) || other.completedDate == completedDate)&&const DeepCollectionEquality().equals(other._taskIds, _taskIds)&&const DeepCollectionEquality().equals(other._chargeIds, _chargeIds)&&const DeepCollectionEquality().equals(other._photoIds, _photoIds)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.inspectorName, inspectorName) || other.inspectorName == inspectorName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,bookingId,type,status,scheduledDate,completedDate,const DeepCollectionEquality().hash(_taskIds),const DeepCollectionEquality().hash(_chargeIds),const DeepCollectionEquality().hash(_photoIds),summary,inspectorName);

@override
String toString() {
  return 'Inspection(id: $id, bookingId: $bookingId, type: $type, status: $status, scheduledDate: $scheduledDate, completedDate: $completedDate, taskIds: $taskIds, chargeIds: $chargeIds, photoIds: $photoIds, summary: $summary, inspectorName: $inspectorName)';
}


}

/// @nodoc
abstract mixin class _$InspectionCopyWith<$Res> implements $InspectionCopyWith<$Res> {
  factory _$InspectionCopyWith(_Inspection value, $Res Function(_Inspection) _then) = __$InspectionCopyWithImpl;
@override @useResult
$Res call({
 String id, String bookingId, InspectionType type, InspectionStatus status, DateTime scheduledDate, DateTime? completedDate, List<String> taskIds, List<String> chargeIds, List<String> photoIds, String? summary, String? inspectorName
});




}
/// @nodoc
class __$InspectionCopyWithImpl<$Res>
    implements _$InspectionCopyWith<$Res> {
  __$InspectionCopyWithImpl(this._self, this._then);

  final _Inspection _self;
  final $Res Function(_Inspection) _then;

/// Create a copy of Inspection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? bookingId = null,Object? type = null,Object? status = null,Object? scheduledDate = null,Object? completedDate = freezed,Object? taskIds = null,Object? chargeIds = null,Object? photoIds = null,Object? summary = freezed,Object? inspectorName = freezed,}) {
  return _then(_Inspection(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,bookingId: null == bookingId ? _self.bookingId : bookingId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as InspectionType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as InspectionStatus,scheduledDate: null == scheduledDate ? _self.scheduledDate : scheduledDate // ignore: cast_nullable_to_non_nullable
as DateTime,completedDate: freezed == completedDate ? _self.completedDate : completedDate // ignore: cast_nullable_to_non_nullable
as DateTime?,taskIds: null == taskIds ? _self._taskIds : taskIds // ignore: cast_nullable_to_non_nullable
as List<String>,chargeIds: null == chargeIds ? _self._chargeIds : chargeIds // ignore: cast_nullable_to_non_nullable
as List<String>,photoIds: null == photoIds ? _self._photoIds : photoIds // ignore: cast_nullable_to_non_nullable
as List<String>,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String?,inspectorName: freezed == inspectorName ? _self.inspectorName : inspectorName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
