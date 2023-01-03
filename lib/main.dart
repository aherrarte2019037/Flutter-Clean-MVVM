import 'package:flutter/material.dart';
import 'package:tutapp/application.dart';
import 'package:tutapp/di/app_module.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp(Application());
}
