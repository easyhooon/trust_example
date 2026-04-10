import '../datasource/registry_remote_datasource.dart';
import '../model/registry_stat.dart';

class RegistryRepository {
  final RegistryRemoteDatasource _datasource;

  RegistryRepository(this._datasource);

  Future<List<Region>> getRegions() {
    return _datasource.getRegions();
  }

  Future<List<Region>> getDistricts(String sidoCode) {
    return _datasource.getDistricts(sidoCode);
  }

  Future<List<RegistryStat>> getRegistryStats({
    required String sidoCode,
    String? sigunguCode,
  }) {
    return _datasource.getRegistryStats(
      sidoCode: sidoCode,
      sigunguCode: sigunguCode,
    );
  }
}
