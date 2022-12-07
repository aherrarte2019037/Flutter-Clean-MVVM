import 'package:flutter/material.dart';

class ApplicationApp extends StatefulWidget {
  const ApplicationApp._internal();

  static const ApplicationApp instance = ApplicationApp._internal(); // Singleton pattern

  factory ApplicationApp() => instance; // Factory for singleton instance

  @override
  State<ApplicationApp> createState() => _ApplicationAppState();
}

class _ApplicationAppState extends State<ApplicationApp> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
