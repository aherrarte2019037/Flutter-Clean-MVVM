import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:tutapp/data/dio/dio_logger.dart';
import 'package:tutapp/data/dio/dio_options.dart';

class DioFactory {
  DioFactory._();

  Future<Dio> get instance => _setUp();

  Future<Dio> _setUp() async {
    final dio = Dio();
    dio.options = DioOptions();

    if (!kReleaseMode) {
      dio.interceptors.add(DioLogger());
    }

    return dio;
  }
}
