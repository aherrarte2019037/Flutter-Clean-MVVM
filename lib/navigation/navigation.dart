import 'package:flutter/material.dart';
import 'package:tutapp/di/app_module.dart';
import 'package:tutapp/domain/models/page_params.dart';
import 'package:tutapp/features/login/login_page.dart';
import 'package:tutapp/features/login/login_page_params.dart';
import 'package:tutapp/features/onboarding/onboarding_carousel.dart';
import 'package:tutapp/features/onboarding/onboarding_page_params.dart';
import 'package:tutapp/navigation/transitions/fade_in_page_transition.dart';
import 'package:tutapp/ui/widgets/blurred_background.dart';
import 'package:tutapp/utils/durations.dart';

class Navigation {
  Navigation._();

  static final navigatorKey = GlobalKey<NavigatorState>();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/onboarding':
        final params = settings.arguments as OnboardingPageParams? ?? const OnboardingPageParams();
        final page = appModule<OnboardingCarousel>(param1: params);
        return _noAnimationRoute(page);

      case '/login':
        final params = settings.arguments as LoginPageParams? ?? const LoginPageParams();
        final page = appModule<LoginPage>(param1: params);
        return params.swipeAnimate ? _materialRoute(page) : _noAnimationRoute(page);

      default:
        return _materialRoute(const SizedBox.shrink());
    }
  }

  static void pop() => popWithResult(null);

  static void popWithResult<T>(T result) => navigatorKey.currentState?.pop(result);

  static Future<T?>? push<T>(
    Widget page, {
    PageParams? params,
    bool fullScreenDialog = false,
  }) async =>
      navigatorKey.currentState?.push(
        _materialRoute(
          page,
          fullscreenDialog: fullScreenDialog,
          params: params,
        ),
      );

  static Future<T?>? pushNamed<T>(
    String routeName,
    PageParams params, {
    bool fullScreenDialog = false,
  }) async =>
      navigatorKey.currentState?.pushNamed(
        routeName,
        arguments: params,
      );

  static Future<T?>? pushReplacement<T>(
    Widget page, {
    PageParams? params,
    bool fullScreenDialog = false,
  }) async =>
      navigatorKey.currentState?.pushReplacement(
        _materialRoute(
          page,
          fullscreenDialog: fullScreenDialog,
          params: params,
        ),
      );

  static Future<T?>? pushReplacementNamed<T>(
    String routeName,
    PageParams params, {
    bool fullScreenDialog = false,
  }) async =>
      navigatorKey.currentState?.pushReplacementNamed(
        routeName,
        arguments: params,
      );

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
  bool fullscreenDialog = false,
  PageParams? params,
}) =>
    MaterialPageRoute(
      settings: RouteSettings(arguments: params),
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

Route<T> _noAnimationRoute<T>(Widget page) => PageRouteBuilder<T>(
      transitionDuration: Duration.zero,
      pageBuilder: _pageBuilder(page),
      reverseTransitionDuration: Duration.zero,
    );
