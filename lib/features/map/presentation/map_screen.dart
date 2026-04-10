import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_theme.dart';
import 'provider/map_provider.dart';

class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({super.key});

  @override
  ConsumerState<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {
  NaverMapController? _mapController;
  MapMarkerData? _selectedMarker;

  @override
  Widget build(BuildContext context) {
    final locationAsync = ref.watch(currentLocationProvider);
    final markers = ref.watch(sampleMarkersProvider);
    final polygons = ref.watch(samplePolygonsProvider);

    return Scaffold(
      body: Stack(
        children: [
          // 지도
          locationAsync.when(
            data: (location) => NaverMap(
              options: NaverMapViewOptions(
                initialCameraPosition: NCameraPosition(
                  target: location,
                  zoom: 12,
                ),
                locationButtonEnable: true,
              ),
              onMapReady: (controller) {
                _mapController = controller;
                _addMarkers(controller, markers);
                _addPolygons(controller, polygons);
              },
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (_, __) => const Center(child: Text('지도를 불러올 수 없습니다')),
          ),
          // 선택된 마커 정보 카드
          if (_selectedMarker != null)
            Positioned(
              left: 16,
              right: 16,
              bottom: 24,
              child: _MarkerInfoCard(
                marker: _selectedMarker!,
                onClose: () => setState(() => _selectedMarker = null),
              ),
            ),
        ],
      ),
    );
  }

  void _addMarkers(NaverMapController controller, List<MapMarkerData> markers) {
    final nMarkers = markers.map((m) {
      final marker = NMarker(
        id: m.id,
        position: m.position,
      );
      marker.setOnTapListener((overlay) {
        setState(() => _selectedMarker = m);
      });
      return marker;
    }).toSet();

    controller.addOverlayAll(nMarkers);
  }

  void _addPolygons(
      NaverMapController controller, List<MapPolygonData> polygons) {
    final nPolygons = polygons.map((p) {
      return NPolygonOverlay(
        id: p.id,
        coords: p.coordinates,
        color: AppColors.primary.withValues(alpha: 0.15),
        outlineColor: AppColors.primary,
        outlineWidth: 2,
      );
    }).toSet();

    controller.addOverlayAll(nPolygons);
  }
}

/// 마커 탭 시 하단 정보 카드
class _MarkerInfoCard extends StatelessWidget {
  final MapMarkerData marker;
  final VoidCallback onClose;

  const _MarkerInfoCard({
    required this.marker,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.location_on,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(marker.title, style: AppTextStyles.body.copyWith(
                    fontWeight: FontWeight.w600,
                  )),
                  const SizedBox(height: 4),
                  Text(marker.description, style: AppTextStyles.caption),
                ],
              ),
            ),
            IconButton(
              onPressed: onClose,
              icon: const Icon(
                Icons.close,
                color: AppColors.textSecondary,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
