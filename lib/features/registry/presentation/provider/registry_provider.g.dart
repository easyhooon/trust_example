// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registry_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$registryRepositoryHash() =>
    r'5b2c69c568786307b760d2ec46e7139ec88966ce';

/// See also [registryRepository].
@ProviderFor(registryRepository)
final registryRepositoryProvider =
    AutoDisposeProvider<RegistryRepository>.internal(
      registryRepository,
      name: r'registryRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$registryRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RegistryRepositoryRef = AutoDisposeProviderRef<RegistryRepository>;
String _$regionsHash() => r'849b85382d7377c044f8a5d76d6cd8c82f747b3e';

/// 시도 목록
///
/// Copied from [regions].
@ProviderFor(regions)
final regionsProvider = AutoDisposeFutureProvider<List<Region>>.internal(
  regions,
  name: r'regionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$regionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RegionsRef = AutoDisposeFutureProviderRef<List<Region>>;
String _$districtsHash() => r'70f7e266cdf4a12ac9b08700ef7d133984b1bbb3';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// 시군구 목록 (시도 선택 시)
///
/// Copied from [districts].
@ProviderFor(districts)
const districtsProvider = DistrictsFamily();

/// 시군구 목록 (시도 선택 시)
///
/// Copied from [districts].
class DistrictsFamily extends Family<AsyncValue<List<Region>>> {
  /// 시군구 목록 (시도 선택 시)
  ///
  /// Copied from [districts].
  const DistrictsFamily();

  /// 시군구 목록 (시도 선택 시)
  ///
  /// Copied from [districts].
  DistrictsProvider call(String sidoCode) {
    return DistrictsProvider(sidoCode);
  }

  @override
  DistrictsProvider getProviderOverride(covariant DistrictsProvider provider) {
    return call(provider.sidoCode);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'districtsProvider';
}

/// 시군구 목록 (시도 선택 시)
///
/// Copied from [districts].
class DistrictsProvider extends AutoDisposeFutureProvider<List<Region>> {
  /// 시군구 목록 (시도 선택 시)
  ///
  /// Copied from [districts].
  DistrictsProvider(String sidoCode)
    : this._internal(
        (ref) => districts(ref as DistrictsRef, sidoCode),
        from: districtsProvider,
        name: r'districtsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$districtsHash,
        dependencies: DistrictsFamily._dependencies,
        allTransitiveDependencies: DistrictsFamily._allTransitiveDependencies,
        sidoCode: sidoCode,
      );

  DistrictsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sidoCode,
  }) : super.internal();

  final String sidoCode;

  @override
  Override overrideWith(
    FutureOr<List<Region>> Function(DistrictsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DistrictsProvider._internal(
        (ref) => create(ref as DistrictsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sidoCode: sidoCode,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Region>> createElement() {
    return _DistrictsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DistrictsProvider && other.sidoCode == sidoCode;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sidoCode.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DistrictsRef on AutoDisposeFutureProviderRef<List<Region>> {
  /// The parameter `sidoCode` of this provider.
  String get sidoCode;
}

class _DistrictsProviderElement
    extends AutoDisposeFutureProviderElement<List<Region>>
    with DistrictsRef {
  _DistrictsProviderElement(super.provider);

  @override
  String get sidoCode => (origin as DistrictsProvider).sidoCode;
}

String _$registryStatsHash() => r'1b25e11b31d42d979405af9e39373af01f71f7cc';

/// 등기 통계 데이터
///
/// Copied from [registryStats].
@ProviderFor(registryStats)
final registryStatsProvider =
    AutoDisposeFutureProvider<List<RegistryStat>>.internal(
      registryStats,
      name: r'registryStatsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$registryStatsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RegistryStatsRef = AutoDisposeFutureProviderRef<List<RegistryStat>>;
String _$selectedSidoHash() => r'94afcaf5262f80d6321b8c91fb671b08883ad37f';

/// 선택된 시도
///
/// Copied from [SelectedSido].
@ProviderFor(SelectedSido)
final selectedSidoProvider =
    AutoDisposeNotifierProvider<SelectedSido, Region?>.internal(
      SelectedSido.new,
      name: r'selectedSidoProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$selectedSidoHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SelectedSido = AutoDisposeNotifier<Region?>;
String _$selectedSigunguHash() => r'ae0361e4e25d9bd01fffb41cd58497cc7020fadd';

/// 선택된 시군구
///
/// Copied from [SelectedSigungu].
@ProviderFor(SelectedSigungu)
final selectedSigunguProvider =
    AutoDisposeNotifierProvider<SelectedSigungu, Region?>.internal(
      SelectedSigungu.new,
      name: r'selectedSigunguProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$selectedSigunguHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SelectedSigungu = AutoDisposeNotifier<Region?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
