// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registry_stat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RegistryStat _$RegistryStatFromJson(Map<String, dynamic> json) =>
    _RegistryStat(
      period: json['period'] as String,
      transferCount: (json['transferCount'] as num).toInt(),
      preservationCount: (json['preservationCount'] as num).toInt(),
      mortgageCount: (json['mortgageCount'] as num).toInt(),
    );

Map<String, dynamic> _$RegistryStatToJson(_RegistryStat instance) =>
    <String, dynamic>{
      'period': instance.period,
      'transferCount': instance.transferCount,
      'preservationCount': instance.preservationCount,
      'mortgageCount': instance.mortgageCount,
    };

_Region _$RegionFromJson(Map<String, dynamic> json) =>
    _Region(code: json['code'] as String, name: json['name'] as String);

Map<String, dynamic> _$RegionToJson(_Region instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
};
