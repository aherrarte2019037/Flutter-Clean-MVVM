import 'package:flutter/material.dart';

class ApplicationApp extends StatefulWidget {
  const ApplicationApp._(); // Private constructor

  static const ApplicationApp instance = ApplicationApp._(); // Singleton pattern

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
