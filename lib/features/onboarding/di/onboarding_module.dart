import 'package:tutapp/di/app_module.dart';
import 'package:tutapp/domain/repositories/local_storage_repository.dart';
import 'package:tutapp/features/onboarding/onboarding_carousel.dart';
import 'package:tutapp/features/onboarding/onboarding_page_params.dart';
import 'package:tutapp/features/onboarding/onboarding_presentation_model.dart';
import 'package:tutapp/features/onboarding/onboarding_presenter.dart';

void initModule() {
  _registerUseCases();
  _registerModels();
  _registerPresenters();
  _registerViews();
}

void _registerUseCases() => {};

void _registerModels() {
  appModule.registerFactoryParam<OnboardingPresentationModel, OnboardingPageParams, dynamic>(
    (pageParams, _) => OnboardingPresentationModel.initial(
      pageParams,
    ),
  );
}

void _registerPresenters() {
  appModule.registerFactoryParam<OnboardingPresenter, OnboardingPageParams, dynamic>(
    (pageParams, _) => OnboardingPresenter(
      appModule<OnboardingPresentationModel>(param1: pageParams),
      appModule<LocalStorageRepository>(),
    ),
  );
}

void _registerViews() {
  appModule.registerFactoryParam<OnboardingCarousel, OnboardingPageParams, dynamic>(
    (pageParams, _) => OnboardingCarousel(
      presenter: appModule<OnboardingPresenter>(param1: pageParams),
    ),
  );
}
