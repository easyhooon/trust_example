// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'law_article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LawSearchResult _$LawSearchResultFromJson(Map<String, dynamic> json) =>
    _LawSearchResult(
      lawId: json['lawId'] as String,
      lawName: json['lawName'] as String,
      lawType: json['lawType'] as String,
      promulgationDate: json['promulgationDate'] as String,
      enforcementDate: json['enforcementDate'] as String,
    );

Map<String, dynamic> _$LawSearchResultToJson(_LawSearchResult instance) =>
    <String, dynamic>{
      'lawId': instance.lawId,
      'lawName': instance.lawName,
      'lawType': instance.lawType,
      'promulgationDate': instance.promulgationDate,
      'enforcementDate': instance.enforcementDate,
    };

_LawArticle _$LawArticleFromJson(Map<String, dynamic> json) => _LawArticle(
  articleNumber: json['articleNumber'] as String,
  articleTitle: json['articleTitle'] as String? ?? '',
  articleContent: json['articleContent'] as String,
);

Map<String, dynamic> _$LawArticleToJson(_LawArticle instance) =>
    <String, dynamic>{
      'articleNumber': instance.articleNumber,
      'articleTitle': instance.articleTitle,
      'articleContent': instance.articleContent,
    };

_LawDetail _$LawDetailFromJson(Map<String, dynamic> json) => _LawDetail(
  lawName: json['lawName'] as String,
  lawType: json['lawType'] as String,
  articles: (json['articles'] as List<dynamic>)
      .map((e) => LawArticle.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$LawDetailToJson(_LawDetail instance) =>
    <String, dynamic>{
      'lawName': instance.lawName,
      'lawType': instance.lawType,
      'articles': instance.articles,
    };
