import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tutapp/features/login/login_presentation_model.dart';
import 'package:tutapp/features/login/login_presenter.dart';
import 'package:tutapp/localization/strings_manager.dart';
import 'package:tutapp/resources/assets.gen.dart';
import 'package:tutapp/ui/theme/color_theme.dart';
import 'package:tutapp/ui/theme/font_theme.dart';
import 'package:tutapp/ui/widgets/buttons/button.dart';
import 'package:tutapp/ui/widgets/buttons/tappable_text.dart';
import 'package:tutapp/ui/widgets/status_bar/dark_status_bar.dart';
import 'package:tutapp/ui/widgets/text_input.dart';
import 'package:tutapp/utils/extensions/bloc_extension.dart';

class LoginPage extends StatefulWidget with HasPresenter<LoginPresenter> {
  const LoginPage({
    super.key,
    required this.presenter,
  });

  @override
  final LoginPresenter presenter;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with PresenterState<LoginViewModel, LoginPresenter, LoginPage> {
  static const _horizontalPadding = EdgeInsets.symmetric(horizontal: 35);
  static const _buttonHeight = 55.0;

  @override
  Widget build(BuildContext context) {
    final tappableTextStyle = FontTheme.caption10.copyWith(
      color: ColorTheme.orange,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.2,
      fontSize: 13,
    );

    return DarkStatusBar(
      child: Scaffold(
        backgroundColor: ColorTheme.blackWhite.shade100,
        body: stateObserver(
          builder: (context, state) => Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Gap(40),
                  Assets.images.appLogo.image(),
                  Padding(
                    padding: _horizontalPadding,
                    child: TextInput(
                      onChanged: presenter.onEmailValueChanged,
                      initialValue: state.emailValue,
                      errorText: state.emailErrorText,
                      hintText: StringsManager.loginEmailFieldHint,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  const Gap(30),
                  Padding(
                    padding: _horizontalPadding,
                    child: TextInput.secret(
                      onChanged: presenter.onPasswordValueChanged,
                      initialValue: state.passwordValue,
                      errorText: state.passwordErrorText,
                      hintText: StringsManager.loginPasswordFieldHint,
                    ),
                  ),
                  const Gap(45),
                  Padding(
                    padding: _horizontalPadding,
                    child: Button(
                      onTap: presenter.onTapLogin,
                      label: StringsManager.loginButtonLabel,
                      size: ButtonSize.fixed(
                        height: _buttonHeight,
                        width: double.infinity,
                      ),
                      isLoading: state.loginStatus.isLoading,
                    ),
                  ),
                  const Gap(25),
                  Padding(
                    padding: _horizontalPadding,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TappableText(
                          StringsManager.loginForgotPasswordLabel,
                          onTap: presenter.onTapForgotPassword,
                          textStyle: tappableTextStyle,
                        ),
                        TappableText(
                          StringsManager.loginRegisterLabel,
                          onTap: presenter.onTapRegister,
                          textStyle: tappableTextStyle,
                        ),
                      ],
                    ),
                  ),
                  const Gap(40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
