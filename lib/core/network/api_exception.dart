import 'package:dio/dio.dart';

class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic data;

  ApiException({
    required this.message,
    this.statusCode,
    this.data,
  });

  factory ApiException.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ApiException(
          message: '서버 응답 시간이 초과되었습니다.',
          statusCode: e.response?.statusCode,
        );
      case DioExceptionType.connectionError:
        return ApiException(
          message: '네트워크에 연결할 수 없습니다.',
        );
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        final message = switch (statusCode) {
          400 => '잘못된 요청입니다.',
          401 => '인증에 실패했습니다.',
          403 => '접근 권한이 없습니다.',
          404 => '요청한 리소스를 찾을 수 없습니다.',
          500 => '서버 오류가 발생했습니다.',
          _ => '알 수 없는 오류가 발생했습니다. ($statusCode)',
        };
        return ApiException(
          message: message,
          statusCode: statusCode,
          data: e.response?.data,
        );
      case DioExceptionType.cancel:
        return ApiException(message: '요청이 취소되었습니다.');
      default:
        return ApiException(message: '알 수 없는 오류가 발생했습니다.');
    }
  }

  @override
  String toString() => 'ApiException($statusCode): $message';
}
