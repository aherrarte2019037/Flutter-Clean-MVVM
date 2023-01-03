import 'package:dio/dio.dart';
import 'package:tutapp/localization/locales.dart';

class ConnectionOptions extends BaseOptions {
  ConnectionOptions({
    required Locales locale,
    String authToken = '',
  }) {
    final durationTimeout = const Duration(minutes: 1).inMilliseconds;

    super.connectTimeout = durationTimeout;
    super.receiveTimeout = durationTimeout;
    super.headers = {
      'content-type': 'application/json',
      'accept': 'application/json',
      'authorization': authToken,
      'language': locale.languageCode,
    };
  }
}
