import 'package:tutapp/features/initial/initial_page_params.dart';

class InitialPagePresentationModel implements InitialPageViewModel {
  InitialPagePresentationModel.initial(
    InitialPageParams params,
  );

  InitialPagePresentationModel._();

  InitialPagePresentationModel copyWith({
    bool? skipOnboarding,
  }) {
    return InitialPagePresentationModel._();
  }
}

abstract class InitialPageViewModel {}
