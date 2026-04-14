// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registry_stat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RegistryStat _$RegistryStatFromJson(Map<String, dynamic> json) =>
    _RegistryStat(
      period: json['period'] as String,
      region: json['region'] as String? ?? '',
      district: json['district'] as String? ?? '',
      count: (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$RegistryStatToJson(_RegistryStat instance) =>
    <String, dynamic>{
      'period': instance.period,
      'region': instance.region,
      'district': instance.district,
      'count': instance.count,
    };

_Region _$RegionFromJson(Map<String, dynamic> json) =>
    _Region(code: json['code'] as String, name: json['name'] as String);

Map<String, dynamic> _$RegionToJson(_Region instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
};
