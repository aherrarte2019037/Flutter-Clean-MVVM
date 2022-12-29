import 'package:dio/dio.dart';
import 'package:tutapp/data/dio/dio_options.dart';

class DioFactory {
  DioFactory._();

  Future<Dio> get instance => _setUp();

  Future<Dio> _setUp() async {
    final dio = Dio();

    dio.options = DioOptions();
    return dio;
  }
}
