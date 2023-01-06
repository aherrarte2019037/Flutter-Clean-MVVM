import 'package:flutter/material.dart';
import 'package:tutapp/localization/strings_manager.dart';
import 'package:tutapp/navigation/navigation.dart';

import 'ui/theme/app_theme_data.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Navigation.navigatorKey,
      onGenerateRoute: Navigation.onGenerateRoute,
      initialRoute: '/onboarding',
      debugShowCheckedModeBanner: false,
      scrollBehavior: AppThemeData.scrollBehavior,
      theme: AppThemeData.lightTheme,
      title: StringsManager.appTitle,
    );
  }
}
