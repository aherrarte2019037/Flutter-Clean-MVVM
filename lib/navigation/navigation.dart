import 'package:flutter/material.dart';
import 'package:flutter_clean_mvvm/presentation/splash/splash_page.dart';
import 'package:go_router/go_router.dart';

class Navigation {
  const Navigation._();

  static final router = GoRouter(
    debugLogDiagnostics: true,
    errorBuilder: (context, state) => const _RouteWrapper(
      child: Text('Route not found'),
    ),
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const _RouteWrapper(
          child: Text('/ - /home'),
        ),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const _RouteWrapper(
          child: Text('/register'),
        ),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const _RouteWrapper(
          child: Text('/login'),
        ),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const _RouteWrapper(
          child: Text('/onboarding'),
        ),
      ),
      GoRoute(
        path: '/forgot-password',
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
