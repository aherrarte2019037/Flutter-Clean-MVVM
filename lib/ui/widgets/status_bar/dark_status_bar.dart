import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DarkStatusBar extends StatelessWidget {
  const DarkStatusBar({
    super.key,
    required this.child,
    required this.style,
  });

  final Widget child;
  final SystemUiOverlayStyle style;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: child,
    );
  }
}
