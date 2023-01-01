import 'package:flutter/material.dart';
import 'package:tutapp/features/login/login_presentation_model.dart';
import 'package:tutapp/features/login/login_presenter.dart';
import 'package:tutapp/resources/assets.gen.dart';
import 'package:tutapp/ui/theme/color_theme.dart';
import 'package:tutapp/ui/widgets/status_bar/dark_status_bar.dart';
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
  @override
  Widget build(BuildContext context) {
    return DarkStatusBar(
      child: Scaffold(
        backgroundColor: ColorTheme.blackWhite.shade100,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Assets.images.appLogo.image(),
            ],
          ),
        ),
      ),
    );
  }
}
