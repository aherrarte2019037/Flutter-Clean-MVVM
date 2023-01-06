import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutapp/domain/use_cases/app_init_usecase.dart';
import 'package:tutapp/features/initial/initial_page_presentation_model.dart';
import 'package:tutapp/features/login/login_page_params.dart';
import 'package:tutapp/features/onboarding/onboarding_page_params.dart';
import 'package:tutapp/navigation/navigation.dart';

class InitialPagePresenter extends Cubit<InitialPageViewModel> {
  InitialPagePresenter(
    InitialPagePresentationModel model,
    this._appInitUseCase,
  ) : super(model);

  final AppInitUseCase _appInitUseCase;

  // ignore: unused_element
  InitialPagePresentationModel get _model => state as InitialPagePresentationModel;

  void onInit() async {
    final skippedOnboarding = (await _appInitUseCase.execute()).skipOnboarding;

    if (skippedOnboarding) {
      Navigation.pushReplacementNamed(
        '/login',
        const LoginPageParams(swipeAnimate: false),
      );
    } else {
      Navigation.pushReplacementNamed(
        '/onboarding',
        const OnboardingPageParams(),
      );
    }
  }
}
