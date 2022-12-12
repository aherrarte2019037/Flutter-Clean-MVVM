import 'package:flutter/material.dart';
import 'package:flutter_clean_mvvm/navigation/routes.dart';
import 'package:go_router/go_router.dart';

class Navigation {
  const Navigation._();

  static final router = GoRouter(
    debugLogDiagnostics: true,
    errorBuilder: (context, state) => const _RouteWrapper(
      child: Text('Route not found'),
    ),
    initialLocation: Routes.home.path,
    routes: [
      GoRoute(
        path: Routes.home.path,
        name: Routes.home.path,
        builder: (context, state) => const _RouteWrapper(
          child: Text('/home'),
        ),
      ),
      GoRoute(
        path: Routes.register.path,
        name: Routes.register.name,
        builder: (context, state) => const _RouteWrapper(
          child: Text('/register'),
        ),
      ),
      GoRoute(
        path: Routes.login.path,
        name: Routes.login.name,
        builder: (context, state) => const _RouteWrapper(
          child: Text('/login'),
        ),
      ),
      GoRoute(
        path: Routes.onboarding.path,
        name: Routes.onboarding.name,
        builder: (context, state) => const _RouteWrapper(
          child: Text('/onboarding'),
        ),
      ),
      GoRoute(
        path: Routes.forgotPassword.path,
        name: Routes.forgotPassword.name,
        builder: (context, state) => const _RouteWrapper(
          child: Text('/forgot-password'),
        ),
      ),
    ],
  );
}

class _RouteWrapper extends StatelessWidget {
  const _RouteWrapper({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(child: child),
      ),
    );
  }
}
