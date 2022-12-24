import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:tutapp/navigation/navigation.dart';

class BlurredBackground extends StatelessWidget {
  const BlurredBackground({
    Key? key,
    required this.child,
    this.blurRadius = _defaultBlurRadius,
    this.opacity = _defaultOpacity,
    this.backgroundColor,
    this.isDismissible = true,
  }) : super(key: key);

  static const _defaultOpacity = 0.5;
  static const _defaultBlurRadius = 10.0;

  final Widget child;
  final double blurRadius;
  final double opacity;
  final Color? backgroundColor;
  final bool isDismissible;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: blurRadius,
              sigmaY: blurRadius,
            ),
            child: GestureDetector(
              onTap: isDismissible ? () => Navigation.pop() : null,
              behavior: HitTestBehavior.translucent,
              child: const SizedBox.expand(),
            ),
          ),
        ),
        Container(
          color: backgroundColor,
          child: child,
        ),
      ],
    );
  }
}
