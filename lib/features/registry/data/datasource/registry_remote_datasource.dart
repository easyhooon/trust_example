import 'package:dio/dio.dart';

import '../../../../core/constants/api_keys.dart';
import '../model/registry_stat.dart';

class RegistryRemoteDatasource {
  static const _baseUrl = 'https://data.iros.go.kr/openapi/cr/rs';
  static const _serviceId = '0000000020';

  final Dio _dio;

  RegistryRemoteDatasource(this._dio);

  /// 시도 목록 (하드코딩 — API에서 별도 제공하지 않음)
  Future<List<Region>> getRegions() async {
    return const [
      Region(code: '900', name: '서울특별시'),
      Region(code: '800', name: '부산광역시'),
      Region(code: '680', name: '대구광역시'),
      Region(code: '690', name: '인천광역시'),
      Region(code: '700', name: '광주광역시'),
      Region(code: '710', name: '대전광역시'),
      Region(code: '720', name: '울산광역시'),
      Region(code: '730', name: '세종특별자치시'),
      Region(code: '410', name: '경기도'),
      Region(code: '530', name: '강원특별자치도'),
      Region(code: '430', name: '충청북도'),
      Region(code: '440', name: '충청남도'),
      Region(code: '450', name: '전북특별자치도'),
      Region(code: '460', name: '전라남도'),
      Region(code: '470', name: '경상북도'),
      Region(code: '480', name: '경상남도'),
      Region(code: '490', name: '제주특별자치도'),
    ];
  }

  /// 시군구 목록 (지역코드 파일 기반이지만, 주요 지역만 하드코딩)
  /// 실제로는 지역코드 파일을 다운받아서 사용해야 함
  Future<List<Region>> getDistricts(String sidoCode) async {
    // 서울 시군구 예시
    if (sidoCode == '900') {
      return const [
        Region(code: '905', name: '강남구'),
        Region(code: '906', name: '강동구'),
        Region(code: '907', name: '강북구'),
        Region(code: '908', name: '강서구'),
        Region(code: '909', name: '관악구'),
        Region(code: '910', name: '광진구'),
        Region(code: '911', name: '구로구'),
        Region(code: '912', name: '금천구'),
        Region(code: '913', name: '노원구'),
        Region(code: '914', name: '도봉구'),
        Region(code: '915', name: '동대문구'),
        Region(code: '916', name: '동작구'),
        Region(code: '917', name: '마포구'),
        Region(code: '918', name: '서대문구'),
        Region(code: '919', name: '서초구'),
        Region(code: '920', name: '성동구'),
        Region(code: '921', name: '성북구'),
        Region(code: '922', name: '송파구'),
        Region(code: '923', name: '양천구'),
        Region(code: '924', name: '영등포구'),
        Region(code: '925', name: '용산구'),
        Region(code: '926', name: '은평구'),
        Region(code: '927', name: '종로구'),
        Region(code: '928', name: '중구'),
        Region(code: '929', name: '중랑구'),
      ];
    }
    return [];
  }

  /// 소유권이전등기(매매) 신청 부동산 현황 조회
  Future<List<RegistryStat>> getRegistryStats({
    required String sidoCode,
    String? sigunguCode,
  }) async {
    // 최근 6개월 월별 조회
    final now = DateTime.now();
    final start = DateTime(now.year, now.month - 5);
    final startDate = '${start.year}${start.month.toString().padLeft(2, '0')}';
    final endDate = '${now.year}${now.month.toString().padLeft(2, '0')}';

    final response = await _dio.get(
      '$_baseUrl/selectCrRsRgsCsOpenApi.rest',
      queryParameters: {
        'id': _serviceId,
        'key': ApiKeys.registryApiKey,
        'reqtype': 'json',
        'search_type_api': '02', // 월별
        'search_start_date_api': startDate,
        'search_end_date_api': endDate,
        'search_regn1_name_api': sidoCode,
        if (sigunguCode != null) 'search_regn2_name_api': sigunguCode,
      },
    );

    final data = response.data;

    // 응답 구조에 맞게 파싱
    final items = data is Map
        ? (data['response']?['body']?['items'] as List? ??
            data['items'] as List? ??
            [])
        : [];

    return items.map((item) {
      return RegistryStat(
        period: item['resDate']?.toString() ?? '',
        region: item['adminRegn1Name']?.toString() ?? '',
        district: item['adminRegn2Name']?.toString() ?? '',
        count: int.tryParse(item['tot']?.toString() ?? '') ?? 0,
      );
    }).toList();
  }
}
