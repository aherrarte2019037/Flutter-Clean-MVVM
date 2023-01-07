import 'package:dio/dio.dart';
import 'package:tutapp/domain/models/visible_failure.dart';
import 'package:tutapp/localization/strings_manager.dart';

//ignore_for_file: no-magic-number
class Failure implements DisplayVisibleFailure {
  Failure.handle(Object error) {
    type = error is DioError ? _handleNetworkError(error) : FailureType.unknown;
  }

  Failure.notConnected() : type = FailureType.notConnected;

  late final FailureType type;

  @override
  // ignore: long-method
  VisibleFailure get visible {
    switch (type) {
      case FailureType.noContent:
        return VisibleFailure(
          message: StringsManager.noContentNetworkError,
        );
      case FailureType.badRequest:
        return VisibleFailure(
          message: StringsManager.badRequestNetworkError,
        );
      case FailureType.forbidden:
        return VisibleFailure(
          message: StringsManager.forbiddenNetworkError,
        );
      case FailureType.unauthorized:
        return VisibleFailure(
          message: StringsManager.unauthorizedNetworkError,
        );
      case FailureType.notFound:
        return VisibleFailure(
          message: StringsManager.notFoundNetworkError,
        );
      case FailureType.serverError:
        return VisibleFailure(
          message: StringsManager.serverErrorNetworkError,
        );
      case FailureType.connectTimeout:
        return VisibleFailure(
          message: StringsManager.connectTimeoutNetworkError,
        );
      case FailureType.cancel:
        return VisibleFailure(
          message: StringsManager.cancelNetworkError,
        );
      case FailureType.receiveTimeout:
        return VisibleFailure(
          message: StringsManager.receiveTimeoutNetworkError,
        );
      case FailureType.sendTimeout:
        return VisibleFailure(
          message: StringsManager.sendTimeoutNetworkError,
        );
      case FailureType.cacheError:
        return VisibleFailure(
          message: StringsManager.cacheErrorNetworkError,
        );
      case FailureType.notConnected:
        return VisibleFailure(
          message: StringsManager.notConnectedNetworkError,
        );
      case FailureType.unknown:
        return VisibleFailure.unknown();
    }
  }

  FailureType _handleNetworkError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
        return FailureType.connectTimeout;
      case DioErrorType.sendTimeout:
        return FailureType.sendTimeout;
      case DioErrorType.receiveTimeout:
        return FailureType.receiveTimeout;
      case DioErrorType.response:
        switch (error.response!.statusCode) {
          case 400:
            return FailureType.badRequest;
          case 401:
            return FailureType.unauthorized;
          case 403:
            return FailureType.forbidden;
          case 404:
            return FailureType.notFound;
          case 500:
            return FailureType.serverError;
          default:
            return FailureType.unknown;
        }
      case DioErrorType.cancel:
        return FailureType.cancel;
      case DioErrorType.other:
        return FailureType.unknown;
    }
  }
}

enum FailureType {
  noContent,
  badRequest,
  forbidden,
  unauthorized,
  notFound,
  serverError,
  connectTimeout,
  cancel,
  receiveTimeout,
  sendTimeout,
  cacheError,
  notConnected,
  unknown;
}
