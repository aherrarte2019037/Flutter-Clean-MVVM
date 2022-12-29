import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:tutapp/data/config/connection_options.dart';
import 'package:tutapp/data/config/logger_options.dart';

class DioOptions extends BaseOptions {
  DioOptions() {
    super.baseUrl = ConnectionOptions.baseUrl;
    super.connectTimeout = ConnectionOptions.connectTimeout;
    super.receiveTimeout = ConnectionOptions.receiveTimeout;
    super.headers = ConnectionOptions.headers;
  }
}
