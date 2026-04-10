import 'package:flutter/material.dart';
import 'package:trust_example/core/theme/app_theme.dart';

class LawSearchScreen extends StatelessWidget {
  const LawSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('법령 검색', style: AppTextStyles.subheading),
      ),
      body: const Center(
        child: Text('법령 검색 화면'),
      ),
    );
  }
}
