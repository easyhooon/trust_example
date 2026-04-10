import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'api_exception.dart';

// build_runner가 @riverpod 어노테이션을 읽고 dioProvider를 자동 생성 (Android의 kapt/ksp와 동일한 컴파일 타임 코드 생성)
part 'dio_client.g.dart';

@riverpod
Dio dio(Ref ref) {
  final dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      sendTimeout: const Duration(seconds: 10),
    ),
  );

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        if (kDebugMode) {
          print('[API] ${options.method} ${options.uri}');
        }
        handler.next(options);
      },
      onResponse: (response, handler) {
        if (kDebugMode) {
          print('[API] ${response.statusCode} ${response.requestOptions.uri}');
        }
        handler.next(response);
      },
      onError: (error, handler) {
        if (kDebugMode) {
          print('[API ERROR] ${error.type} ${error.message}');
        }
        handler.reject(
          DioException(
            requestOptions: error.requestOptions,
            error: ApiException.fromDioException(error),
            type: error.type,
            response: error.response,
          ),
        );
      },
    ),
  );

  return dio;
}
