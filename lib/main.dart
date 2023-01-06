import 'package:flutter/material.dart';
import 'package:tutapp/application.dart';
import 'package:tutapp/di/app_module.dart';
import 'package:tutapp/domain/models/local_storage_key.dart';
import 'package:tutapp/domain/repositories/local_storage_repository.dart';
import 'package:tutapp/localization/locales.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  await configureSystemLocale();
  runApp(const Application());
}

Future<void> configureSystemLocale() async {
  final localStorageRepository = appModule<LocalStorageRepository>();
  final localeDefined = await localStorageRepository.containsKey(
    key: LocalStorageKey.userLocale,
  );

  if (localeDefined) return;

  final systemLocale = WidgetsBinding.instance.window.locale;
  final userLocale = Locales.fromJson(systemLocale.languageCode);

  await localStorageRepository.save(
    key: LocalStorageKey.userLocale,
    data: userLocale,
  );
}
