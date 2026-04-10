import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiKeys {
  static String get lawApiKey => dotenv.env['LAW_API_KEY'] ?? '';
  static String get registryApiKey => dotenv.env['REGISTRY_API_KEY'] ?? '';
  static String get naverMapClientId => dotenv.env['NAVER_MAP_CLIENT_ID'] ?? '';
}
