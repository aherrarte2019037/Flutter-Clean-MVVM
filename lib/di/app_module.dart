import 'package:device_info_plus/device_info_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tutapp/data/clients/auth_client.dart';
import 'package:tutapp/data/config/config_constants.dart';
import 'package:tutapp/data/dio/dio_factory.dart';
import 'package:tutapp/data/sources/auth_data_source.dart';
import 'package:tutapp/data/sources/connection_status.dart';
import 'package:tutapp/domain/repositories/local_storage_repository.dart';
import 'package:tutapp/validators/email_validator.dart';
import 'package:tutapp/validators/password_validator.dart';

final appModule = GetIt.instance;

Future<void> initAppModule() async {
  _registerValidators();
  _registerDependencies();
  _registerRepositories();
  _registerFactories();
  await _registerClients();
  _registerDataSources();
}

void _registerValidators() {
  appModule.registerLazySingleton<EmailValidator>(() => EmailValidator());
  appModule.registerLazySingleton<PasswordValidator>(() => PasswordValidator());
}

void _registerDependencies() {
  appModule.registerLazySingleton<InternetConnectionChecker>(
    () => InternetConnectionChecker.createInstance(
      checkInterval: ConfigConstants.connectionCheckerInterval,
      checkTimeout: ConfigConstants.connectionCheckerTimeout,
    ),
  );
  appModule.registerLazySingleton(() => DeviceInfoPlugin());
}

void _registerRepositories() {
  appModule.registerLazySingleton<LocalStorageRepository>(
    () => const LocalStorageRepositoryImpl(),
  );
}

void _registerFactories() {
  appModule.registerLazySingleton<DioFactory>(
    () => DioFactory(appModule<LocalStorageRepository>()),
  );
}

Future<void> _registerClients() async {
  final dio = await appModule<DioFactory>().getDio();
  appModule.registerLazySingleton<AuthClient>(() => AuthClient(dio));
}

void _registerDataSources() {
  appModule.registerLazySingleton<AuthDataSource>(
    () => AuthDataSourceImpl(authClient: appModule<AuthClient>()),
  );
  appModule.registerLazySingleton<ConnectionStatus>(
    () => ConnectionStatusImpl(connectionChecker: appModule<InternetConnectionChecker>()),
  );
}
