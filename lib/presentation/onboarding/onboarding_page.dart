import 'package:flutter/material.dart';
import 'package:flutter_clean_mvvm/ui/theme/color_theme.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.blackWhite.shade100,
      body: const SafeArea(
        child: Center(
          child: Text('Onboarding Page'),
        ),
      ),
    );
  }
}
