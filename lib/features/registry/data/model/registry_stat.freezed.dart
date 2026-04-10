// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'registry_stat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RegistryStat {

/// 기간 (예: 2024-01)
 String get period;/// 소유권이전(매매) 건수
 int get transferCount;/// 소유권보존 건수
 int get preservationCount;/// 설정(근저당 등) 건수
 int get mortgageCount;
/// Create a copy of RegistryStat
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegistryStatCopyWith<RegistryStat> get copyWith => _$RegistryStatCopyWithImpl<RegistryStat>(this as RegistryStat, _$identity);

  /// Serializes this RegistryStat to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegistryStat&&(identical(other.period, period) || other.period == period)&&(identical(other.transferCount, transferCount) || other.transferCount == transferCount)&&(identical(other.preservationCount, preservationCount) || other.preservationCount == preservationCount)&&(identical(other.mortgageCount, mortgageCount) || other.mortgageCount == mortgageCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,period,transferCount,preservationCount,mortgageCount);

@override
String toString() {
  return 'RegistryStat(period: $period, transferCount: $transferCount, preservationCount: $preservationCount, mortgageCount: $mortgageCount)';
}


}

/// @nodoc
abstract mixin class $RegistryStatCopyWith<$Res>  {
  factory $RegistryStatCopyWith(RegistryStat value, $Res Function(RegistryStat) _then) = _$RegistryStatCopyWithImpl;
@useResult
$Res call({
 String period, int transferCount, int preservationCount, int mortgageCount
});




}
/// @nodoc
class _$RegistryStatCopyWithImpl<$Res>
    implements $RegistryStatCopyWith<$Res> {
  _$RegistryStatCopyWithImpl(this._self, this._then);

  final RegistryStat _self;
  final $Res Function(RegistryStat) _then;

/// Create a copy of RegistryStat
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? period = null,Object? transferCount = null,Object? preservationCount = null,Object? mortgageCount = null,}) {
  return _then(_self.copyWith(
period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as String,transferCount: null == transferCount ? _self.transferCount : transferCount // ignore: cast_nullable_to_non_nullable
as int,preservationCount: null == preservationCount ? _self.preservationCount : preservationCount // ignore: cast_nullable_to_non_nullable
as int,mortgageCount: null == mortgageCount ? _self.mortgageCount : mortgageCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [RegistryStat].
extension RegistryStatPatterns on RegistryStat {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegistryStat value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegistryStat() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegistryStat value)  $default,){
final _that = this;
switch (_that) {
case _RegistryStat():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegistryStat value)?  $default,){
final _that = this;
switch (_that) {
case _RegistryStat() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String period,  int transferCount,  int preservationCount,  int mortgageCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegistryStat() when $default != null:
return $default(_that.period,_that.transferCount,_that.preservationCount,_that.mortgageCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String period,  int transferCount,  int preservationCount,  int mortgageCount)  $default,) {final _that = this;
switch (_that) {
case _RegistryStat():
return $default(_that.period,_that.transferCount,_that.preservationCount,_that.mortgageCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String period,  int transferCount,  int preservationCount,  int mortgageCount)?  $default,) {final _that = this;
switch (_that) {
case _RegistryStat() when $default != null:
return $default(_that.period,_that.transferCount,_that.preservationCount,_that.mortgageCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RegistryStat implements RegistryStat {
  const _RegistryStat({required this.period, required this.transferCount, required this.preservationCount, required this.mortgageCount});
  factory _RegistryStat.fromJson(Map<String, dynamic> json) => _$RegistryStatFromJson(json);

/// 기간 (예: 2024-01)
@override final  String period;
/// 소유권이전(매매) 건수
@override final  int transferCount;
/// 소유권보존 건수
@override final  int preservationCount;
/// 설정(근저당 등) 건수
@override final  int mortgageCount;

/// Create a copy of RegistryStat
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegistryStatCopyWith<_RegistryStat> get copyWith => __$RegistryStatCopyWithImpl<_RegistryStat>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RegistryStatToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegistryStat&&(identical(other.period, period) || other.period == period)&&(identical(other.transferCount, transferCount) || other.transferCount == transferCount)&&(identical(other.preservationCount, preservationCount) || other.preservationCount == preservationCount)&&(identical(other.mortgageCount, mortgageCount) || other.mortgageCount == mortgageCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,period,transferCount,preservationCount,mortgageCount);

@override
String toString() {
  return 'RegistryStat(period: $period, transferCount: $transferCount, preservationCount: $preservationCount, mortgageCount: $mortgageCount)';
}


}

/// @nodoc
abstract mixin class _$RegistryStatCopyWith<$Res> implements $RegistryStatCopyWith<$Res> {
  factory _$RegistryStatCopyWith(_RegistryStat value, $Res Function(_RegistryStat) _then) = __$RegistryStatCopyWithImpl;
@override @useResult
$Res call({
 String period, int transferCount, int preservationCount, int mortgageCount
});




}
/// @nodoc
class __$RegistryStatCopyWithImpl<$Res>
    implements _$RegistryStatCopyWith<$Res> {
  __$RegistryStatCopyWithImpl(this._self, this._then);

  final _RegistryStat _self;
  final $Res Function(_RegistryStat) _then;

/// Create a copy of RegistryStat
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? period = null,Object? transferCount = null,Object? preservationCount = null,Object? mortgageCount = null,}) {
  return _then(_RegistryStat(
period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as String,transferCount: null == transferCount ? _self.transferCount : transferCount // ignore: cast_nullable_to_non_nullable
as int,preservationCount: null == preservationCount ? _self.preservationCount : preservationCount // ignore: cast_nullable_to_non_nullable
as int,mortgageCount: null == mortgageCount ? _self.mortgageCount : mortgageCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$Region {

 String get code; String get name;
/// Create a copy of Region
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegionCopyWith<Region> get copyWith => _$RegionCopyWithImpl<Region>(this as Region, _$identity);

  /// Serializes this Region to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Region&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,name);

@override
String toString() {
  return 'Region(code: $code, name: $name)';
}


}

/// @nodoc
abstract mixin class $RegionCopyWith<$Res>  {
  factory $RegionCopyWith(Region value, $Res Function(Region) _then) = _$RegionCopyWithImpl;
@useResult
$Res call({
 String code, String name
});




}
/// @nodoc
class _$RegionCopyWithImpl<$Res>
    implements $RegionCopyWith<$Res> {
  _$RegionCopyWithImpl(this._self, this._then);

  final Region _self;
  final $Res Function(Region) _then;

/// Create a copy of Region
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? name = null,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Region].
extension RegionPatterns on Region {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Region value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Region() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Region value)  $default,){
final _that = this;
switch (_that) {
case _Region():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Region value)?  $default,){
final _that = this;
switch (_that) {
case _Region() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Region() when $default != null:
return $default(_that.code,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  String name)  $default,) {final _that = this;
switch (_that) {
case _Region():
return $default(_that.code,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  String name)?  $default,) {final _that = this;
switch (_that) {
case _Region() when $default != null:
return $default(_that.code,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Region implements Region {
  const _Region({required this.code, required this.name});
  factory _Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);

@override final  String code;
@override final  String name;

/// Create a copy of Region
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegionCopyWith<_Region> get copyWith => __$RegionCopyWithImpl<_Region>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RegionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Region&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,name);

@override
String toString() {
  return 'Region(code: $code, name: $name)';
}


}

/// @nodoc
abstract mixin class _$RegionCopyWith<$Res> implements $RegionCopyWith<$Res> {
  factory _$RegionCopyWith(_Region value, $Res Function(_Region) _then) = __$RegionCopyWithImpl;
@override @useResult
$Res call({
 String code, String name
});




}
/// @nodoc
class __$RegionCopyWithImpl<$Res>
    implements _$RegionCopyWith<$Res> {
  __$RegionCopyWithImpl(this._self, this._then);

  final _Region _self;
  final $Res Function(_Region) _then;

/// Create a copy of Region
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? name = null,}) {
  return _then(_Region(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
