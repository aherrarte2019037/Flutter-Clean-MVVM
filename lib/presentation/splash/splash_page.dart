import 'package:flutter/material.dart';
import 'package:flutter_clean_mvvm/resources/assets.gen.dart';
import 'package:flutter_clean_mvvm/ui/theme/color_theme.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.orange,
      body: Center(
        child: Assets.images.splashLogo.image(),
      ),
    );
  }
}