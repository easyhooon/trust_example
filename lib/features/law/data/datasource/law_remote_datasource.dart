import 'package:dio/dio.dart';
import 'package:xml/xml.dart';

import '../../../../core/constants/api_keys.dart';
import '../model/law_article.dart';

class LawRemoteDatasource {
  final Dio _dio;

  LawRemoteDatasource(this._dio);

  // TODO: 국가법령정보센터 API는 등록된 서버 IP에서만 호출 가능.
  //  모바일 앱에서 직접 호출 시 "사용자 정보 검증 실패" 에러 발생.
  //  해결 방안: 프록시 서버를 두거나, 마이페이지에서 IP 등록 필요.

  /// 현행법령(시행일) 목록 검색
  Future<List<LawSearchResult>> searchLaws({
    required String query,
    int display = 20,
    int page = 1,
  }) async {
    final response = await _dio.get(
      'http://www.law.go.kr/DRF/lawSearch.do',
      queryParameters: {
        'OC': ApiKeys.lawApiKey,
        'target': 'eflaw',
        'type': 'XML',
        'query': query,
        'display': display,
        'page': page,
        'nw': 3, // 현행법령만
      },
    );

    final document = XmlDocument.parse(response.data as String);
    final laws = document.findAllElements('law');

    return laws.map((element) {
      return LawSearchResult(
        lawId: _getText(element, '법령일련번호'),
        lawName: _getText(element, '법령명한글'),
        lawType: _getText(element, '법령구분명'),
        promulgationDate: _getText(element, '공포일자'),
        enforcementDate: _getText(element, '시행일자'),
      );
    }).toList();
  }

  /// 법령 상세 조회 (조문)
  Future<LawDetail> getLawDetail(String lawId) async {
    final response = await _dio.get(
      'http://www.law.go.kr/DRF/lawService.do',
      queryParameters: {
        'OC': ApiKeys.lawApiKey,
        'target': 'eflaw',
        'type': 'XML',
        'ID': lawId,
      },
    );

    final document = XmlDocument.parse(response.data as String);

    final lawName = _getTextFromRoot(document, '법령명_한글');
    final lawType = _getTextFromRoot(document, '법종구분');

    final articles = document.findAllElements('조문단위').map((element) {
      return LawArticle(
        articleNumber: _getText(element, '조문번호'),
        articleTitle: _getText(element, '조문제목'),
        articleContent: _getText(element, '조문내용'),
      );
    }).toList();

    return LawDetail(
      lawName: lawName,
      lawType: lawType,
      articles: articles,
    );
  }

  String _getText(XmlElement element, String tag) {
    return element.findElements(tag).firstOrNull?.innerText.trim() ?? '';
  }

  String _getTextFromRoot(XmlDocument document, String tag) {
    return document.findAllElements(tag).firstOrNull?.innerText.trim() ?? '';
  }
}
