import 'package:flutter/material.dart';
import 'package:tutapp/di/app_module.dart';
import 'package:tutapp/features/initial/initial_page.dart';
import 'package:tutapp/features/initial/initial_page_params.dart';
import 'package:tutapp/localization/strings_manager.dart';
import 'package:tutapp/navigation/navigation.dart';

import 'ui/theme/app_theme_data.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  late InitialPage _initialPage;

  @override
  void initState() {
    super.initState();
    _initialPage = appModule<InitialPage>(param1: const InitialPageParams());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Navigation.navigatorKey,
      onGenerateRoute: Navigation.onGenerateRoute,
      home: _initialPage,
      debugShowCheckedModeBanner: false,
      scrollBehavior: AppThemeData.scrollBehavior,
      theme: AppThemeData.lightTheme,
      title: StringsManager.appTitle,
    );
  }
}
