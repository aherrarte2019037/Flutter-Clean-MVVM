import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tutapp/data/clients/auth_client.dart';
import 'package:tutapp/data/sources/auth_data_source.dart';
import 'package:tutapp/data/sources/connection_status.dart';
import 'package:tutapp/domain/repositories/auth_repository.dart';
import 'package:tutapp/domain/repositories/device_info_repository.dart';
import 'package:tutapp/domain/use_cases/login_usecase.dart';
import 'package:tutapp/features/login/login_page.dart';
import 'package:tutapp/features/login/login_presentation_model.dart';
import 'package:tutapp/features/login/login_presenter.dart';
import 'package:tutapp/features/onboarding/onboarding_carousel.dart';
import 'package:tutapp/features/onboarding/onboarding_presentation_model.dart';
import 'package:tutapp/features/onboarding/onboarding_presenter.dart';
import 'package:tutapp/navigation/transitions/fade_in_page_transition.dart';
import 'package:tutapp/ui/widgets/blurred_background.dart';
import 'package:tutapp/utils/durations.dart';
import 'package:tutapp/validators/email_validator.dart';
import 'package:tutapp/validators/password_validator.dart';

class Navigation {
  Navigation._();

  static final navigatorKey = GlobalKey<NavigatorState>();

  static final routes = {
    '/onboarding': (context) => OnboardingCarousel(
          presenter: OnboardingPresenter(
            OnboardingPresentationModel.initial(),
          ),
        ),
    '/login': (context) => LoginPage(
          presenter: LoginPresenter(
            LoginPresentationModel.initial(
              EmailValidator(),
              PasswordValidator(),
            ),
            LoginUseCase(
              AuthRepositoryImpl(
                AuthDataSourceImpl(
                  authClient: AuthClient(Dio()),
                ),
                ConnectionStatusImpl(connectionChecker: InternetConnectionChecker()),
              ),
              DeviceInfoRepositoryImpl(DeviceInfoPlugin()),
            ),
          ),
        ),
  };

  static void pop() => popWithResult(null);

  static void popWithResult<T>(T result) => navigatorKey.currentState?.pop(result);

  static Future<T?>? push<T>(
    Widget page, {
    arguments,
    bool fullScreenDialog = false,
  }) async =>
      navigatorKey.currentState?.push(
        _materialRoute(page, fullscreenDialog: fullScreenDialog),
      );

  static Future<T?>? pushNamed<T>(
    String routeName, {
    arguments,
    bool fullScreenDialog = false,
  }) async =>
      navigatorKey.currentState?.pushNamed(routeName);

  static Future<T?>? pushReplacement<T>(
    Widget page, {
    arguments,
    bool fullScreenDialog = false,
  }) async =>
      navigatorKey.currentState?.pushReplacement(
        _materialRoute(page, fullscreenDialog: fullScreenDialog),
      );

  static Future<T?>? pushReplacementNamed<T>(
    String routeName, {
    arguments,
    bool fullScreenDialog = false,
  }) async =>
      navigatorKey.currentState?.pushReplacementNamed(routeName);

  static Future<T?>? pushModalRoute<T>(
    Widget page, {
    int? durationMillis,
    bool dismissible = true,
  }) =>
      navigatorKey.currentState?.push(
        _fadeInRoute(
          BlurredBackground(child: page),
          durationMillis: durationMillis,
          opaque: false,
          fullScreenDialog: true,
        ),
      );
}

RoutePageBuilder _pageBuilder(Widget page) => (
      context,
      animation,
      secondaryAnimation,
    ) =>
        page;

Route<T> _materialRoute<T>(
  Widget page, {
  required bool fullscreenDialog,
}) =>
    MaterialPageRoute(
      builder: (context) => page,
      fullscreenDialog: fullscreenDialog,
    );

//ignore: long-parameter-list
Route<T> _fadeInRoute<T>(
  Widget page, {
  int? durationMillis,
  String? pageName,
  bool opaque = true,
  bool fadeOut = true,
  bool fullScreenDialog = false,
}) =>
    PageRouteBuilder<T>(
      opaque: opaque,
      transitionDuration: Duration(
        milliseconds: durationMillis ?? Durations.medium,
      ),
      pageBuilder: _pageBuilder(page),
      transitionsBuilder: fadeInPageTransition(fadeOut: fadeOut),
      fullscreenDialog: fullScreenDialog,
    );
