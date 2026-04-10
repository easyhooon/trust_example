import 'package:dio/dio.dart';

import '../../../../core/constants/api_keys.dart';
import '../model/registry_stat.dart';

class RegistryRemoteDatasource {
  final Dio _dio;

  RegistryRemoteDatasource(this._dio);

  /// 시도 목록 조회
  Future<List<Region>> getRegions() async {
    final response = await _dio.get(
      'https://data.iros.go.kr/openApi/api/openApiSido.do',
      queryParameters: {
        'accessToken': ApiKeys.registryApiKey,
        'responseType': 'json',
      },
    );

    final data = response.data;
    final items = data['sidoList'] as List? ?? [];

    return items.map((item) {
      return Region(
        code: item['sidoCd']?.toString() ?? '',
        name: item['sidoNm']?.toString() ?? '',
      );
    }).toList();
  }

  /// 시군구 목록 조회
  Future<List<Region>> getDistricts(String sidoCode) async {
    final response = await _dio.get(
      'https://data.iros.go.kr/openApi/api/openApiSigungu.do',
      queryParameters: {
        'accessToken': ApiKeys.registryApiKey,
        'responseType': 'json',
        'sidoCd': sidoCode,
      },
    );

    final data = response.data;
    final items = data['sigunguList'] as List? ?? [];

    return items.map((item) {
      return Region(
        code: item['sigunguCd']?.toString() ?? '',
        name: item['sigunguNm']?.toString() ?? '',
      );
    }).toList();
  }

  /// 등기 통계 조회
  Future<List<RegistryStat>> getRegistryStats({
    required String sidoCode,
    String? sigunguCode,
  }) async {
    final response = await _dio.get(
      'https://data.iros.go.kr/openApi/api/openApiRgstStat.do',
      queryParameters: {
        'accessToken': ApiKeys.registryApiKey,
        'responseType': 'json',
        'sidoCd': sidoCode,
        if (sigunguCode != null) 'sigunguCd': sigunguCode,
      },
    );

    final data = response.data;
    final items = data['statList'] as List? ?? [];

    return items.map((item) {
      return RegistryStat(
        period: item['statYm']?.toString() ?? '',
        transferCount: int.tryParse(item['ownTransCnt']?.toString() ?? '') ?? 0,
        preservationCount:
            int.tryParse(item['ownPresCnt']?.toString() ?? '') ?? 0,
        mortgageCount:
            int.tryParse(item['mrtgSetCnt']?.toString() ?? '') ?? 0,
      );
    }).toList();
  }
}
