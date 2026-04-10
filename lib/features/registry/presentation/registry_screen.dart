import 'package:flutter/material.dart';
import 'package:trust_example/core/theme/app_theme.dart';

class RegistryScreen extends StatelessWidget {
  const RegistryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('등기 통계', style: AppTextStyles.subheading),
      ),
      body: const Center(
        child: Text('등기 통계 화면'),
      ),
    );
  }
}
