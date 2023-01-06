import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:tutapp/data/config/connection_options.dart';
import 'package:tutapp/data/config/logger_options.dart';
import 'package:tutapp/domain/models/local_storage_key.dart';
import 'package:tutapp/domain/repositories/local_storage_repository.dart';
import 'package:tutapp/localization/locales.dart';

class DioFactory {
  DioFactory(
    this._localStorageRepository,
  );

  final LocalStorageRepository _localStorageRepository;

  Future<Dio> getDio() async {
    final dio = Dio();
    final userLocale = await _localStorageRepository.read<Locales>(
      key: LocalStorageKey.userLocale,
      defaultValue: Locales.en,
      enumDecoder: Locales.fromJson,
    );

    dio.options = ConnectionOptions(
      locale: userLocale,
    );

    if (!kReleaseMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestBody: LoggerOptions.requestBody,
        requestHeader: LoggerOptions.requestHeader,
        responseBody: LoggerOptions.responseBody,
        responseHeader: LoggerOptions.responseHeader,
      ));
    }

    return dio;
  }
}
