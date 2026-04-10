// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'law_article.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LawSearchResult {

/// 법령일련번호
 String get lawId;/// 법령명 (한글)
 String get lawName;/// 법령종류 (법률, 대통령령, 시행규칙 등)
 String get lawType;/// 공포일자
 String get promulgationDate;/// 시행일자
 String get enforcementDate;
/// Create a copy of LawSearchResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LawSearchResultCopyWith<LawSearchResult> get copyWith => _$LawSearchResultCopyWithImpl<LawSearchResult>(this as LawSearchResult, _$identity);

  /// Serializes this LawSearchResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LawSearchResult&&(identical(other.lawId, lawId) || other.lawId == lawId)&&(identical(other.lawName, lawName) || other.lawName == lawName)&&(identical(other.lawType, lawType) || other.lawType == lawType)&&(identical(other.promulgationDate, promulgationDate) || other.promulgationDate == promulgationDate)&&(identical(other.enforcementDate, enforcementDate) || other.enforcementDate == enforcementDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lawId,lawName,lawType,promulgationDate,enforcementDate);

@override
String toString() {
  return 'LawSearchResult(lawId: $lawId, lawName: $lawName, lawType: $lawType, promulgationDate: $promulgationDate, enforcementDate: $enforcementDate)';
}


}

/// @nodoc
abstract mixin class $LawSearchResultCopyWith<$Res>  {
  factory $LawSearchResultCopyWith(LawSearchResult value, $Res Function(LawSearchResult) _then) = _$LawSearchResultCopyWithImpl;
@useResult
$Res call({
 String lawId, String lawName, String lawType, String promulgationDate, String enforcementDate
});




}
/// @nodoc
class _$LawSearchResultCopyWithImpl<$Res>
    implements $LawSearchResultCopyWith<$Res> {
  _$LawSearchResultCopyWithImpl(this._self, this._then);

  final LawSearchResult _self;
  final $Res Function(LawSearchResult) _then;

/// Create a copy of LawSearchResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lawId = null,Object? lawName = null,Object? lawType = null,Object? promulgationDate = null,Object? enforcementDate = null,}) {
  return _then(_self.copyWith(
lawId: null == lawId ? _self.lawId : lawId // ignore: cast_nullable_to_non_nullable
as String,lawName: null == lawName ? _self.lawName : lawName // ignore: cast_nullable_to_non_nullable
as String,lawType: null == lawType ? _self.lawType : lawType // ignore: cast_nullable_to_non_nullable
as String,promulgationDate: null == promulgationDate ? _self.promulgationDate : promulgationDate // ignore: cast_nullable_to_non_nullable
as String,enforcementDate: null == enforcementDate ? _self.enforcementDate : enforcementDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LawSearchResult].
extension LawSearchResultPatterns on LawSearchResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LawSearchResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LawSearchResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LawSearchResult value)  $default,){
final _that = this;
switch (_that) {
case _LawSearchResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LawSearchResult value)?  $default,){
final _that = this;
switch (_that) {
case _LawSearchResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String lawId,  String lawName,  String lawType,  String promulgationDate,  String enforcementDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LawSearchResult() when $default != null:
return $default(_that.lawId,_that.lawName,_that.lawType,_that.promulgationDate,_that.enforcementDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String lawId,  String lawName,  String lawType,  String promulgationDate,  String enforcementDate)  $default,) {final _that = this;
switch (_that) {
case _LawSearchResult():
return $default(_that.lawId,_that.lawName,_that.lawType,_that.promulgationDate,_that.enforcementDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String lawId,  String lawName,  String lawType,  String promulgationDate,  String enforcementDate)?  $default,) {final _that = this;
switch (_that) {
case _LawSearchResult() when $default != null:
return $default(_that.lawId,_that.lawName,_that.lawType,_that.promulgationDate,_that.enforcementDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LawSearchResult implements LawSearchResult {
  const _LawSearchResult({required this.lawId, required this.lawName, required this.lawType, required this.promulgationDate, required this.enforcementDate});
  factory _LawSearchResult.fromJson(Map<String, dynamic> json) => _$LawSearchResultFromJson(json);

/// 법령일련번호
@override final  String lawId;
/// 법령명 (한글)
@override final  String lawName;
/// 법령종류 (법률, 대통령령, 시행규칙 등)
@override final  String lawType;
/// 공포일자
@override final  String promulgationDate;
/// 시행일자
@override final  String enforcementDate;

/// Create a copy of LawSearchResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LawSearchResultCopyWith<_LawSearchResult> get copyWith => __$LawSearchResultCopyWithImpl<_LawSearchResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LawSearchResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LawSearchResult&&(identical(other.lawId, lawId) || other.lawId == lawId)&&(identical(other.lawName, lawName) || other.lawName == lawName)&&(identical(other.lawType, lawType) || other.lawType == lawType)&&(identical(other.promulgationDate, promulgationDate) || other.promulgationDate == promulgationDate)&&(identical(other.enforcementDate, enforcementDate) || other.enforcementDate == enforcementDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lawId,lawName,lawType,promulgationDate,enforcementDate);

@override
String toString() {
  return 'LawSearchResult(lawId: $lawId, lawName: $lawName, lawType: $lawType, promulgationDate: $promulgationDate, enforcementDate: $enforcementDate)';
}


}

/// @nodoc
abstract mixin class _$LawSearchResultCopyWith<$Res> implements $LawSearchResultCopyWith<$Res> {
  factory _$LawSearchResultCopyWith(_LawSearchResult value, $Res Function(_LawSearchResult) _then) = __$LawSearchResultCopyWithImpl;
@override @useResult
$Res call({
 String lawId, String lawName, String lawType, String promulgationDate, String enforcementDate
});




}
/// @nodoc
class __$LawSearchResultCopyWithImpl<$Res>
    implements _$LawSearchResultCopyWith<$Res> {
  __$LawSearchResultCopyWithImpl(this._self, this._then);

  final _LawSearchResult _self;
  final $Res Function(_LawSearchResult) _then;

/// Create a copy of LawSearchResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lawId = null,Object? lawName = null,Object? lawType = null,Object? promulgationDate = null,Object? enforcementDate = null,}) {
  return _then(_LawSearchResult(
lawId: null == lawId ? _self.lawId : lawId // ignore: cast_nullable_to_non_nullable
as String,lawName: null == lawName ? _self.lawName : lawName // ignore: cast_nullable_to_non_nullable
as String,lawType: null == lawType ? _self.lawType : lawType // ignore: cast_nullable_to_non_nullable
as String,promulgationDate: null == promulgationDate ? _self.promulgationDate : promulgationDate // ignore: cast_nullable_to_non_nullable
as String,enforcementDate: null == enforcementDate ? _self.enforcementDate : enforcementDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$LawArticle {

/// 조문번호
 String get articleNumber;/// 조문제목
 String get articleTitle;/// 조문내용
 String get articleContent;
/// Create a copy of LawArticle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LawArticleCopyWith<LawArticle> get copyWith => _$LawArticleCopyWithImpl<LawArticle>(this as LawArticle, _$identity);

  /// Serializes this LawArticle to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LawArticle&&(identical(other.articleNumber, articleNumber) || other.articleNumber == articleNumber)&&(identical(other.articleTitle, articleTitle) || other.articleTitle == articleTitle)&&(identical(other.articleContent, articleContent) || other.articleContent == articleContent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,articleNumber,articleTitle,articleContent);

@override
String toString() {
  return 'LawArticle(articleNumber: $articleNumber, articleTitle: $articleTitle, articleContent: $articleContent)';
}


}

/// @nodoc
abstract mixin class $LawArticleCopyWith<$Res>  {
  factory $LawArticleCopyWith(LawArticle value, $Res Function(LawArticle) _then) = _$LawArticleCopyWithImpl;
@useResult
$Res call({
 String articleNumber, String articleTitle, String articleContent
});




}
/// @nodoc
class _$LawArticleCopyWithImpl<$Res>
    implements $LawArticleCopyWith<$Res> {
  _$LawArticleCopyWithImpl(this._self, this._then);

  final LawArticle _self;
  final $Res Function(LawArticle) _then;

/// Create a copy of LawArticle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? articleNumber = null,Object? articleTitle = null,Object? articleContent = null,}) {
  return _then(_self.copyWith(
articleNumber: null == articleNumber ? _self.articleNumber : articleNumber // ignore: cast_nullable_to_non_nullable
as String,articleTitle: null == articleTitle ? _self.articleTitle : articleTitle // ignore: cast_nullable_to_non_nullable
as String,articleContent: null == articleContent ? _self.articleContent : articleContent // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LawArticle].
extension LawArticlePatterns on LawArticle {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LawArticle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LawArticle() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LawArticle value)  $default,){
final _that = this;
switch (_that) {
case _LawArticle():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LawArticle value)?  $default,){
final _that = this;
switch (_that) {
case _LawArticle() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String articleNumber,  String articleTitle,  String articleContent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LawArticle() when $default != null:
return $default(_that.articleNumber,_that.articleTitle,_that.articleContent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String articleNumber,  String articleTitle,  String articleContent)  $default,) {final _that = this;
switch (_that) {
case _LawArticle():
return $default(_that.articleNumber,_that.articleTitle,_that.articleContent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String articleNumber,  String articleTitle,  String articleContent)?  $default,) {final _that = this;
switch (_that) {
case _LawArticle() when $default != null:
return $default(_that.articleNumber,_that.articleTitle,_that.articleContent);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LawArticle implements LawArticle {
  const _LawArticle({required this.articleNumber, this.articleTitle = '', required this.articleContent});
  factory _LawArticle.fromJson(Map<String, dynamic> json) => _$LawArticleFromJson(json);

/// 조문번호
@override final  String articleNumber;
/// 조문제목
@override@JsonKey() final  String articleTitle;
/// 조문내용
@override final  String articleContent;

/// Create a copy of LawArticle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LawArticleCopyWith<_LawArticle> get copyWith => __$LawArticleCopyWithImpl<_LawArticle>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LawArticleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LawArticle&&(identical(other.articleNumber, articleNumber) || other.articleNumber == articleNumber)&&(identical(other.articleTitle, articleTitle) || other.articleTitle == articleTitle)&&(identical(other.articleContent, articleContent) || other.articleContent == articleContent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,articleNumber,articleTitle,articleContent);

@override
String toString() {
  return 'LawArticle(articleNumber: $articleNumber, articleTitle: $articleTitle, articleContent: $articleContent)';
}


}

/// @nodoc
abstract mixin class _$LawArticleCopyWith<$Res> implements $LawArticleCopyWith<$Res> {
  factory _$LawArticleCopyWith(_LawArticle value, $Res Function(_LawArticle) _then) = __$LawArticleCopyWithImpl;
@override @useResult
$Res call({
 String articleNumber, String articleTitle, String articleContent
});




}
/// @nodoc
class __$LawArticleCopyWithImpl<$Res>
    implements _$LawArticleCopyWith<$Res> {
  __$LawArticleCopyWithImpl(this._self, this._then);

  final _LawArticle _self;
  final $Res Function(_LawArticle) _then;

/// Create a copy of LawArticle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? articleNumber = null,Object? articleTitle = null,Object? articleContent = null,}) {
  return _then(_LawArticle(
articleNumber: null == articleNumber ? _self.articleNumber : articleNumber // ignore: cast_nullable_to_non_nullable
as String,articleTitle: null == articleTitle ? _self.articleTitle : articleTitle // ignore: cast_nullable_to_non_nullable
as String,articleContent: null == articleContent ? _self.articleContent : articleContent // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$LawDetail {

/// 법령명
 String get lawName;/// 법령종류
 String get lawType;/// 조문 목록
 List<LawArticle> get articles;
/// Create a copy of LawDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LawDetailCopyWith<LawDetail> get copyWith => _$LawDetailCopyWithImpl<LawDetail>(this as LawDetail, _$identity);

  /// Serializes this LawDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LawDetail&&(identical(other.lawName, lawName) || other.lawName == lawName)&&(identical(other.lawType, lawType) || other.lawType == lawType)&&const DeepCollectionEquality().equals(other.articles, articles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lawName,lawType,const DeepCollectionEquality().hash(articles));

@override
String toString() {
  return 'LawDetail(lawName: $lawName, lawType: $lawType, articles: $articles)';
}


}

/// @nodoc
abstract mixin class $LawDetailCopyWith<$Res>  {
  factory $LawDetailCopyWith(LawDetail value, $Res Function(LawDetail) _then) = _$LawDetailCopyWithImpl;
@useResult
$Res call({
 String lawName, String lawType, List<LawArticle> articles
});




}
/// @nodoc
class _$LawDetailCopyWithImpl<$Res>
    implements $LawDetailCopyWith<$Res> {
  _$LawDetailCopyWithImpl(this._self, this._then);

  final LawDetail _self;
  final $Res Function(LawDetail) _then;

/// Create a copy of LawDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lawName = null,Object? lawType = null,Object? articles = null,}) {
  return _then(_self.copyWith(
lawName: null == lawName ? _self.lawName : lawName // ignore: cast_nullable_to_non_nullable
as String,lawType: null == lawType ? _self.lawType : lawType // ignore: cast_nullable_to_non_nullable
as String,articles: null == articles ? _self.articles : articles // ignore: cast_nullable_to_non_nullable
as List<LawArticle>,
  ));
}

}


/// Adds pattern-matching-related methods to [LawDetail].
extension LawDetailPatterns on LawDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LawDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LawDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LawDetail value)  $default,){
final _that = this;
switch (_that) {
case _LawDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LawDetail value)?  $default,){
final _that = this;
switch (_that) {
case _LawDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String lawName,  String lawType,  List<LawArticle> articles)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LawDetail() when $default != null:
return $default(_that.lawName,_that.lawType,_that.articles);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String lawName,  String lawType,  List<LawArticle> articles)  $default,) {final _that = this;
switch (_that) {
case _LawDetail():
return $default(_that.lawName,_that.lawType,_that.articles);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String lawName,  String lawType,  List<LawArticle> articles)?  $default,) {final _that = this;
switch (_that) {
case _LawDetail() when $default != null:
return $default(_that.lawName,_that.lawType,_that.articles);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LawDetail implements LawDetail {
  const _LawDetail({required this.lawName, required this.lawType, required final  List<LawArticle> articles}): _articles = articles;
  factory _LawDetail.fromJson(Map<String, dynamic> json) => _$LawDetailFromJson(json);

/// 법령명
@override final  String lawName;
/// 법령종류
@override final  String lawType;
/// 조문 목록
 final  List<LawArticle> _articles;
/// 조문 목록
@override List<LawArticle> get articles {
  if (_articles is EqualUnmodifiableListView) return _articles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_articles);
}


/// Create a copy of LawDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LawDetailCopyWith<_LawDetail> get copyWith => __$LawDetailCopyWithImpl<_LawDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LawDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LawDetail&&(identical(other.lawName, lawName) || other.lawName == lawName)&&(identical(other.lawType, lawType) || other.lawType == lawType)&&const DeepCollectionEquality().equals(other._articles, _articles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lawName,lawType,const DeepCollectionEquality().hash(_articles));

@override
String toString() {
  return 'LawDetail(lawName: $lawName, lawType: $lawType, articles: $articles)';
}


}

/// @nodoc
abstract mixin class _$LawDetailCopyWith<$Res> implements $LawDetailCopyWith<$Res> {
  factory _$LawDetailCopyWith(_LawDetail value, $Res Function(_LawDetail) _then) = __$LawDetailCopyWithImpl;
@override @useResult
$Res call({
 String lawName, String lawType, List<LawArticle> articles
});




}
/// @nodoc
class __$LawDetailCopyWithImpl<$Res>
    implements _$LawDetailCopyWith<$Res> {
  __$LawDetailCopyWithImpl(this._self, this._then);

  final _LawDetail _self;
  final $Res Function(_LawDetail) _then;

/// Create a copy of LawDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lawName = null,Object? lawType = null,Object? articles = null,}) {
  return _then(_LawDetail(
lawName: null == lawName ? _self.lawName : lawName // ignore: cast_nullable_to_non_nullable
as String,lawType: null == lawType ? _self.lawType : lawType // ignore: cast_nullable_to_non_nullable
as String,articles: null == articles ? _self._articles : articles // ignore: cast_nullable_to_non_nullable
as List<LawArticle>,
  ));
}


}

// dart format on
