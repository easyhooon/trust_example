import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_provider.g.dart';

/// 현재 위치 조회
@riverpod
Future<NLatLng> currentLocation(Ref ref) async {
  // 위치 권한 확인
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // 권한 거부 시 서울시청 기본 좌표
      return const NLatLng(37.5666, 126.9784);
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return const NLatLng(37.5666, 126.9784);
  }

  final position = await Geolocator.getCurrentPosition();
  return NLatLng(position.latitude, position.longitude);
}

/// 샘플 마커 데이터 (정비구역 예시)
@riverpod
List<MapMarkerData> sampleMarkers(Ref ref) {
  return [
    MapMarkerData(
      id: 'gangnam',
      position: const NLatLng(37.4979, 127.0276),
      title: '강남구 개포동 정비구역',
      description: '재건축 진행 중',
    ),
    MapMarkerData(
      id: 'songpa',
      position: const NLatLng(37.5145, 127.1059),
      title: '송파구 잠실동 정비구역',
      description: '재개발 예정',
    ),
    MapMarkerData(
      id: 'yongsan',
      position: const NLatLng(37.5326, 126.9908),
      title: '용산구 한남동 정비구역',
      description: '신탁방식 추진',
    ),
  ];
}

/// 샘플 폴리곤 데이터 (구역 경계 예시)
@riverpod
List<MapPolygonData> samplePolygons(Ref ref) {
  return [
    MapPolygonData(
      id: 'gangnam_area',
      coordinates: const [
        NLatLng(37.4960, 127.0250),
        NLatLng(37.4960, 127.0300),
        NLatLng(37.5000, 127.0300),
        NLatLng(37.5000, 127.0250),
      ],
      label: '개포 정비구역',
    ),
    MapPolygonData(
      id: 'yongsan_area',
      coordinates: const [
        NLatLng(37.5310, 126.9880),
        NLatLng(37.5310, 126.9940),
        NLatLng(37.5345, 126.9940),
        NLatLng(37.5345, 126.9880),
      ],
      label: '한남 정비구역',
    ),
  ];
}

/// 마커 데이터 모델
class MapMarkerData {
  final String id;
  final NLatLng position;
  final String title;
  final String description;

  MapMarkerData({
    required this.id,
    required this.position,
    required this.title,
    required this.description,
  });
}

/// 폴리곤 데이터 모델
class MapPolygonData {
  final String id;
  final List<NLatLng> coordinates;
  final String label;

  MapPolygonData({
    required this.id,
    required this.coordinates,
    required this.label,
  });
}
