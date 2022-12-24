import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutapp/features/onboarding/onboarding_presentation_model.dart';
import 'package:tutapp/navigation/navigation.dart';

class OnboardingPresenter extends Cubit<OnboardingViewModel> {
  OnboardingPresenter(
    OnboardingPresentationModel model,
  ) : super(model);

  OnboardingPresentationModel get _model => state as OnboardingPresentationModel;

  void onPageChanged(int index) => emit(_model.copyWith(carouselIndex: index));

  void onTapNextPage() {
    if (state.onLastItem) onTapSkip();
  }

  void onTapSkip() => Navigation.pushReplacementNamed('/login');
}
