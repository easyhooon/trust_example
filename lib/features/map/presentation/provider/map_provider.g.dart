// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentLocationHash() => r'514a56f538c7c178fb0b971f1f3b1bdeaabaca06';

/// 현재 위치 조회
///
/// Copied from [currentLocation].
@ProviderFor(currentLocation)
final currentLocationProvider = AutoDisposeFutureProvider<NLatLng>.internal(
  currentLocation,
  name: r'currentLocationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentLocationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentLocationRef = AutoDisposeFutureProviderRef<NLatLng>;
String _$sampleMarkersHash() => r'7196abe557de9e854563bcdeba3dd9559667bab9';

/// 샘플 마커 데이터 (정비구역 예시)
///
/// Copied from [sampleMarkers].
@ProviderFor(sampleMarkers)
final sampleMarkersProvider = AutoDisposeProvider<List<MapMarkerData>>.internal(
  sampleMarkers,
  name: r'sampleMarkersProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sampleMarkersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SampleMarkersRef = AutoDisposeProviderRef<List<MapMarkerData>>;
String _$samplePolygonsHash() => r'1ac9c9139485c581963d90a3ff81d22a2535669a';

/// 샘플 폴리곤 데이터 (구역 경계 예시)
///
/// Copied from [samplePolygons].
@ProviderFor(samplePolygons)
final samplePolygonsProvider =
    AutoDisposeProvider<List<MapPolygonData>>.internal(
      samplePolygons,
      name: r'samplePolygonsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$samplePolygonsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SamplePolygonsRef = AutoDisposeProviderRef<List<MapPolygonData>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
