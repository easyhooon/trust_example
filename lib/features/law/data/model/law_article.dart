import 'package:freezed_annotation/freezed_annotation.dart';

part 'law_article.freezed.dart';
part 'law_article.g.dart';

/// 법령 검색 결과 항목
@freezed
abstract class LawSearchResult with _$LawSearchResult {
  const factory LawSearchResult({
    /// 법령일련번호
    required String lawId,

    /// 법령명 (한글)
    required String lawName,

    /// 법령종류 (법률, 대통령령, 시행규칙 등)
    required String lawType,

    /// 공포일자
    required String promulgationDate,

    /// 시행일자
    required String enforcementDate,
  }) = _LawSearchResult;

  factory LawSearchResult.fromJson(Map<String, dynamic> json) =>
      _$LawSearchResultFromJson(json);
}

/// 법령 상세 조문
@freezed
abstract class LawArticle with _$LawArticle {
  const factory LawArticle({
    /// 조문번호
    required String articleNumber,

    /// 조문제목
    @Default('') String articleTitle,

    /// 조문내용
    required String articleContent,
  }) = _LawArticle;

  factory LawArticle.fromJson(Map<String, dynamic> json) =>
      _$LawArticleFromJson(json);
}

/// 법령 상세 정보
@freezed
abstract class LawDetail with _$LawDetail {
  const factory LawDetail({
    /// 법령명
    required String lawName,

    /// 법령종류
    required String lawType,

    /// 조문 목록
    required List<LawArticle> articles,
  }) = _LawDetail;

  factory LawDetail.fromJson(Map<String, dynamic> json) =>
      _$LawDetailFromJson(json);
}
