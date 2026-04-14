import 'package:freezed_annotation/freezed_annotation.dart';

part 'registry_stat.freezed.dart';
part 'registry_stat.g.dart';

/// 소유권이전등기(매매) 신청 부동산 현황
@freezed
abstract class RegistryStat with _$RegistryStat {
  const factory RegistryStat({
    /// 결과일자 (월별: 202401)
    required String period,

    /// 시도명
    @Default('') String region,

    /// 시군구명
    @Default('') String district,

    /// 건수
    required int count,
  }) = _RegistryStat;

  factory RegistryStat.fromJson(Map<String, dynamic> json) =>
      _$RegistryStatFromJson(json);
}

/// 지역 정보
@freezed
abstract class Region with _$Region {
  const factory Region({
    required String code,
    required String name,
  }) = _Region;

  factory Region.fromJson(Map<String, dynamic> json) =>
      _$RegionFromJson(json);
}
