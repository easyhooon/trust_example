import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/dio_client.dart';
import '../../data/datasource/registry_remote_datasource.dart';
import '../../data/model/registry_stat.dart';
import '../../data/repository/registry_repository.dart';

part 'registry_provider.g.dart';

@riverpod
RegistryRepository registryRepository(Ref ref) {
  final dio = ref.watch(dioProvider);
  return RegistryRepository(RegistryRemoteDatasource(dio));
}

/// 시도 목록
@riverpod
Future<List<Region>> regions(Ref ref) async {
  final repository = ref.watch(registryRepositoryProvider);
  return repository.getRegions();
}

/// 시군구 목록 (시도 선택 시)
@riverpod
Future<List<Region>> districts(Ref ref, String sidoCode) async {
  final repository = ref.watch(registryRepositoryProvider);
  return repository.getDistricts(sidoCode);
}

/// 선택된 시도
@riverpod
class SelectedSido extends _$SelectedSido {
  @override
  Region? build() => null;

  void select(Region? region) {
    state = region;
    // 시도 변경 시 시군구 초기화
    ref.read(selectedSigunguProvider.notifier).select(null);
  }
}

/// 선택된 시군구
@riverpod
class SelectedSigungu extends _$SelectedSigungu {
  @override
  Region? build() => null;

  void select(Region? region) {
    state = region;
  }
}

/// 등기 통계 데이터
@riverpod
Future<List<RegistryStat>> registryStats(Ref ref) async {
  final sido = ref.watch(selectedSidoProvider);
  if (sido == null) return [];

  final sigungu = ref.watch(selectedSigunguProvider);
  final repository = ref.watch(registryRepositoryProvider);

  return repository.getRegistryStats(
    sidoCode: sido.code,
    sigunguCode: sigungu?.code,
  );
}
