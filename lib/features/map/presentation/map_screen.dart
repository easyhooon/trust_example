import 'package:flutter/material.dart';
import 'package:trust_example/core/theme/app_theme.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('지도', style: AppTextStyles.subheading),
      ),
      body: const Center(
        child: Text('네이버 지도 화면'),
      ),
    );
  }
}
