import 'package:freezed_annotation/freezed_annotation.dart';

part 'registry_stat.freezed.dart';
part 'registry_stat.g.dart';

/// 등기 통계 항목
@freezed
abstract class RegistryStat with _$RegistryStat {
  const factory RegistryStat({
    /// 기간 (예: 2024-01)
    required String period,

    /// 소유권이전(매매) 건수
    required int transferCount,

    /// 소유권보존 건수
    required int preservationCount,

    /// 설정(근저당 등) 건수
    required int mortgageCount,
  }) = _RegistryStat;

  factory RegistryStat.fromJson(Map<String, dynamic> json) =>
      _$RegistryStatFromJson(json);
}

/// 시도 정보
@freezed
abstract class Region with _$Region {
  const factory Region({
    required String code,
    required String name,
  }) = _Region;

  factory Region.fromJson(Map<String, dynamic> json) =>
      _$RegionFromJson(json);
}
