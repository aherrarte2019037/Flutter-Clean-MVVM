import 'package:tutapp/di/app_module.dart';
import 'package:tutapp/domain/repositories/auth_repository.dart';
import 'package:tutapp/domain/repositories/device_info_repository.dart';
import 'package:tutapp/domain/repositories/local_storage_repository.dart';
import 'package:tutapp/domain/use_cases/login_usecase.dart';
import 'package:tutapp/features/login/login_page.dart';
import 'package:tutapp/features/login/login_page_params.dart';
import 'package:tutapp/features/login/login_presentation_model.dart';
import 'package:tutapp/features/login/login_presenter.dart';
import 'package:tutapp/features/onboarding/onboarding_carousel.dart';
import 'package:tutapp/features/onboarding/onboarding_page_params.dart';
import 'package:tutapp/features/onboarding/onboarding_presentation_model.dart';
import 'package:tutapp/features/onboarding/onboarding_presenter.dart';
import 'package:tutapp/validators/email_validator.dart';
import 'package:tutapp/validators/password_validator.dart';

void initLoginModule() {
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

  appModule.registerFactoryParam<OnboardingPresentationModel, OnboardingPageParams, dynamic>(
    (pageParams, _) => OnboardingPresentationModel.initial(
      pageParams,
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
  appModule.registerFactoryParam<OnboardingPresenter, OnboardingPageParams, dynamic>(
    (pageParams, _) => OnboardingPresenter(
      appModule<OnboardingPresentationModel>(param1: pageParams),
      appModule<LocalStorageRepository>(),
    ),
  );
}

void _registerViews() {
  appModule.registerFactoryParam<LoginPage, LoginPageParams, dynamic>(
    (pageParams, _) => LoginPage(
      presenter: appModule<LoginPresenter>(param1: pageParams),
    ),
  );
  appModule.registerFactoryParam<OnboardingCarousel, OnboardingPageParams, dynamic>(
    (pageParams, _) => OnboardingCarousel(
      presenter: appModule<OnboardingPresenter>(param1: pageParams),
    ),
  );
}
