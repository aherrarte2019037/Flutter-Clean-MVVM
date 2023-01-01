import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutapp/features/login/login_presentation_model.dart';
import 'package:tutapp/navigation/navigation.dart';

class LoginPresenter extends Cubit<LoginViewModel> {
  LoginPresenter(
    LoginPresentationModel model,
  ) : super(model);

  LoginPresentationModel get _model => state as LoginPresentationModel;

  void onEmailValueChanged(String value) => emit(_model.copyWith(emailValue: value));

  void onPasswordValueChanged(String value) => emit(_model.copyWith(passwordValue: value));

  void onTapLogin() {
    if (!_model.enableLogin) return;
  }

  void onTapRegister() => Navigation.pushNamed('/register');

  void onTapForgotPassword() => Navigation.pushNamed('/forgotPassword');
}
