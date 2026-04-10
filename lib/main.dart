import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'core/constants/api_keys.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');

  // 네이버 맵 SDK 초기화
  await NaverMapSdk.instance.initialize(
    clientId: ApiKeys.naverMapClientId,
  );

  runApp(
    const ProviderScope(
      child: TrustExampleApp(),
    ),
  );
}
