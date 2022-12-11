import 'package:flutter/material.dart';
import 'package:flutter_clean_mvvm/localization/strings_manager.dart';
import 'package:flutter_clean_mvvm/navigation/app_router.dart';
import 'package:flutter_clean_mvvm/ui/theme/app_theme_data.dart';

class Application extends StatefulWidget {
  const Application._(); // Private constructor

  static const Application _instance = Application._(); // Singleton pattern

  factory Application() => _instance; // Factory for singleton instance

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: AppRouter.router.routeInformationParser,
      routerDelegate: AppRouter.router.routerDelegate,
      theme: AppThemeData.lightTheme,
      title: StringsManager.appTitle,
    );
  }
}
