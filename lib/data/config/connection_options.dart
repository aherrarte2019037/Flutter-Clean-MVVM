import 'package:dio/dio.dart';
import 'package:tutapp/localization/locales.dart';

class ConnectionOptions extends BaseOptions {
  ConnectionOptions({
    required String baseUrl,
    required Locales locale,
    String authToken = '',
  }) {
    final durationTimeout = const Duration(minutes: 1).inMilliseconds;

    super.baseUrl = baseUrl;
    super.connectTimeout = durationTimeout;
    super.receiveTimeout = durationTimeout;
    super.headers = {
      'content-type': 'application/json; charset=utf-8',
      'accept': 'application/json; charset=utf-8',
      'authorization': authToken,
      'language': locale.languageCode,
    };
  }
}
