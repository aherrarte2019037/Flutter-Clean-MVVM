import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutapp/domain/models/local_storage_key.dart';
import 'package:tutapp/domain/repositories/local_storage_repository.dart';
import 'package:tutapp/features/login/login_page_params.dart';
import 'package:tutapp/features/onboarding/onboarding_presentation_model.dart';
import 'package:tutapp/navigation/navigation.dart';

class OnboardingPresenter extends Cubit<OnboardingViewModel> {
  OnboardingPresenter(
    OnboardingPresentationModel model,
    this._localStorageRepository,
  ) : super(model);

  final LocalStorageRepository _localStorageRepository;

  OnboardingPresentationModel get _model => state as OnboardingPresentationModel;

  void onPageChanged(int index) => emit(_model.copyWith(carouselIndex: index));

  void onTapNextPage() {
    if (_model.onLastItem) onTapSkip();
  }

  void onTapSkip() {
    _localStorageRepository.save(key: LocalStorageKey.skipOnboarding, data: true);
    Navigation.pushReplacementNamed('/login', const LoginPageParams());
  }
}
