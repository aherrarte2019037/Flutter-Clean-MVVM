import 'package:tutapp/di/app_module.dart';
import 'package:tutapp/domain/repositories/local_storage_repository.dart';
import 'package:tutapp/domain/use_cases/app_init_usecase.dart';
import 'package:tutapp/features/initial/initial_page.dart';
import 'package:tutapp/features/initial/initial_page_params.dart';
import 'package:tutapp/features/initial/initial_page_presentation_model.dart';
import 'package:tutapp/features/initial/initial_page_presenter.dart';

void initModule() {
  _registerUseCases();
  _registerModels();
  _registerPresenters();
  _registerViews();
}

void _registerUseCases() {
  appModule.registerFactory<AppInitUseCase>(
    () => AppInitUseCase(
      appModule<LocalStorageRepository>(),
    ),
  );
}

void _registerModels() {
  appModule.registerFactoryParam<InitialPagePresentationModel, InitialPageParams, dynamic>(
    (pageParams, _) => InitialPagePresentationModel.initial(
      pageParams,
    ),
  );
}

void _registerPresenters() {
  appModule.registerFactoryParam<InitialPagePresenter, InitialPageParams, dynamic>(
    (pageParams, _) => InitialPagePresenter(
      appModule<InitialPagePresentationModel>(param1: pageParams),
      appModule<AppInitUseCase>(),
    ),
  );
}

void _registerViews() {
  appModule.registerFactoryParam<InitialPage, InitialPageParams, dynamic>(
    (pageParams, _) => InitialPage(
      presenter: appModule<InitialPagePresenter>(param1: pageParams),
    ),
  );
}
