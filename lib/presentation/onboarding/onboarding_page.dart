import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tutapp/presentation/onboarding/onboarding_item.dart';
import 'package:tutapp/ui/theme/color_theme.dart';
import 'package:tutapp/ui/theme/font_theme.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    super.key,
    required this.item,
  });

  static const _pagePadding = 24.0;

  final OnboardingItem item;

  @override
  Widget build(BuildContext context) {
    final textColor = ColorTheme.blackWhite.shade700;
    final titleStyle = FontTheme.title10.copyWith(
      color: textColor,
      fontWeight: FontWeight.w500,
    );
    final subtitleStyle = FontTheme.body10.copyWith(
      color: textColor,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: _pagePadding),
          child: Text(
            item.title,
            textAlign: TextAlign.center,
            style: titleStyle,
          ),
        ),
        const Gap(10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: _pagePadding),
          child: Text(
            item.subtitle,
            textAlign: TextAlign.center,
            style: subtitleStyle,
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: _pagePadding),
          child: item.image,
        ),
        const Spacer(),
      ],
    );
  }
}
