import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutapp/domain/models/login_result.dart';
import 'package:tutapp/domain/use_cases/login_usecase.dart';
import 'package:tutapp/features/login/domain/login_failure.dart';
import 'package:tutapp/features/login/login_presentation_model.dart';

class LoginPresenter extends Cubit<LoginViewModel> {
  LoginPresenter(
    LoginPresentationModel model,
    this._loginUseCase,
  ) : super(model);

  final LoginUseCase _loginUseCase;

  LoginPresentationModel get _model => state as LoginPresentationModel;

  void onEmailValueChanged(String value) {
    emit(_model.copyWith(
      emailValue: value,
      emailErrorText: _model.validateEmail(value).message,
    ));
  }

  void onPasswordValueChanged(String value) {
    emit(_model.copyWith(
      passwordValue: value,
      passwordErrorText: _model.validatePassword(value).message,
    ));
  }

  Future<void> onTapLogin() async {
    emit(_model.validateFields());
    if (!_model.enableLogin) return;

    emit(_model.copyWith(isLoading: true));
    await _loginUseCase.execute(LoginUseCaseInput(
      email: _model.emailValue,
      password: _model.passwordValue,
    ))
      ..fold(_onLoginFailure, _onLoginSuccess);
    emit(_model.copyWith(isLoading: false));
  }

  void onTapRegister() => {};

  void onTapForgotPassword() => {};

  void _onLoginFailure(LoginFailure failure) {
    switch (failure.type) {
      case LoginFailureType.notRegistered:
        return emit(_model.copyWith(
          emailErrorText: failure.visible.message,
        ));

      case LoginFailureType.wrongPassword:
        emit(_model.copyWith(
          passwordErrorText: failure.visible.message,
          passwordValue: '',
        ));
        break;

      case LoginFailureType.noConnection:
      case LoginFailureType.unknown:
        break;
    }
  }

  void _onLoginSuccess(LoginResult result) => {};
}
