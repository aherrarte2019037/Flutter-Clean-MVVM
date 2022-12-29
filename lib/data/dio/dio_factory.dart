import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:tutapp/data/config/connection_options.dart';
import 'package:tutapp/data/config/logger_options.dart';

class DioFactory {
  DioFactory._();

  Future<Dio> get instance => _setUp();

  Future<Dio> _setUp() async {
    final dio = Dio();
    dio.options = BaseOptions(
      baseUrl: ConnectionOptions.baseUrl,
      connectTimeout: ConnectionOptions.connectTimeout,
      receiveTimeout: ConnectionOptions.receiveTimeout,
      headers: ConnectionOptions.headers,
    );

    if (!kReleaseMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestBody: LoggerOptions.requestBody,
        requestHeader: LoggerOptions.requestHeader,
        responseBody: LoggerOptions.responseBody,
        responseHeader: LoggerOptions.requestHeader,
      ));
    }

    return dio;
  }
}
