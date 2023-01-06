import 'package:tutapp/di/app_module.dart';
import 'package:tutapp/domain/repositories/auth_repository.dart';
import 'package:tutapp/domain/repositories/device_info_repository.dart';
import 'package:tutapp/domain/use_cases/login_usecase.dart';
import 'package:tutapp/features/login/login_page.dart';
import 'package:tutapp/features/login/login_page_params.dart';
import 'package:tutapp/features/login/login_presentation_model.dart';
import 'package:tutapp/features/login/login_presenter.dart';
import 'package:tutapp/validators/email_validator.dart';
import 'package:tutapp/validators/password_validator.dart';

void initModule() {
  _registerUseCases();
  _registerModels();
  _registerPresenters();
  _registerViews();
}

void _registerUseCases() {
  appModule.registerFactory<LoginUseCase>(
    () => LoginUseCase(
      appModule<AuthRepository>(),
      appModule<DeviceInfoRepository>(),
    ),
  );
}

void _registerModels() {
  appModule.registerFactoryParam<LoginPresentationModel, LoginPageParams, dynamic>(
    (pageParams, _) => LoginPresentationModel.initial(
      pageParams,
      appModule<EmailValidator>(),
      appModule<PasswordValidator>(),
    ),
  );
}

void _registerPresenters() {
  appModule.registerFactoryParam<LoginPresenter, LoginPageParams, dynamic>(
    (pageParams, _) => LoginPresenter(
      appModule<LoginPresentationModel>(param1: pageParams),
      appModule<LoginUseCase>(),
    ),
  );
}

void _registerViews() {
  appModule.registerFactoryParam<LoginPage, LoginPageParams, dynamic>(
    (pageParams, _) => LoginPage(
      presenter: appModule<LoginPresenter>(param1: pageParams),
    ),
  );
}
