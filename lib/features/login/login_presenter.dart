import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutapp/domain/use_cases/login_usecase.dart';
import 'package:tutapp/features/login/domain/login_result_status.dart';
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
      emailValidationResult: _model.validateEmail(value),
    ));
  }

  void onPasswordValueChanged(String value) {
    emit(_model.copyWith(
      passwordValue: value,
      passwordValidationResult: _model.validatePassword(value),
    ));
  }

  Future<void> onTapLogin() async {
    emit(_model.validateFields());
    if (!_model.enableLogin) return;

    emit(_model.copyWith(loginStatus: LoginResultStatus.loading));
    await _loginUseCase.execute(LoginUseCaseInput(
      email: _model.emailValue,
      password: _model.passwordValue,
    ))
      ..fold(
        (failure) => inspect(failure),
        (result) => inspect(result),
      );
    emit(_model.copyWith(loginStatus: LoginResultStatus.fullFilled));
  }

  void onTapRegister() => {};

  void onTapForgotPassword() => {};
}
