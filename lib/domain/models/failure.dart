import 'package:dio/dio.dart';

//ignore_for_file: no-magic-number
class Failure {
  Failure.handle(Object error) {
    if (error is DioError) type = _handleNetworkError(error);
    type = FailureType.unknown;
  }

  Failure.notConnected(): type = FailureType.notConnected;

  late final FailureType type;

  FailureType _handleNetworkError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout: return FailureType.connectTimeout;
      case DioErrorType.sendTimeout:    return FailureType.sendTimeout;
      case DioErrorType.receiveTimeout: return FailureType.receiveTimeout;
      case DioErrorType.response:
        switch (error.response!.statusCode) {
          case 400: return FailureType.badRequest;
          case 401: return FailureType.unauthorized;
          case 403: return FailureType.forbidden;
          case 404: return FailureType.notFound;
          case 500: return FailureType.serverError;
          default: return FailureType.unknown;
        }
      case DioErrorType.cancel: return FailureType.cancel;
      case DioErrorType.other:  return FailureType.unknown;
    }
  }
}

enum FailureType {
  success(200, 'Success'),
  noContent(201, 'Success with no content'),
  badRequest(400, 'Bad request, try again later'),
  forbidden(403, 'Forbidden request, try again later'),
  unauthorized(401, 'Unauthorized request, try again later'),
  notFound(404, 'Destination not found, try again later'),
  serverError(500, 'Server error, try again later'),
  connectTimeout(600, 'Connection timeout, , try again later'),
  cancel(601, 'Request cancelled, , try again later'),
  receiveTimeout(602, 'Receive timeout, , try again later'),
  sendTimeout(603, 'Send timeout, try again later'),
  cacheError(604, 'Cache error, try again later'),
  notConnected(605, 'Check your internet connection'),
  unknown(999, 'Unknown error');

  const FailureType(this.code, this.message);
  
  final int code;
  final String message;
}
