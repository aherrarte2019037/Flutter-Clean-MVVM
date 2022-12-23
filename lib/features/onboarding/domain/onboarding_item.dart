import 'package:flutter_svg/svg.dart';

class OnboardingItem {
  const OnboardingItem({
    this.title = '',
    this.subtitle = '',
    required this.image,
  });

  final String title;
  final String subtitle;
  final SvgPicture image;
}
