import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tutapp/localization/strings_manager.dart';
import 'package:tutapp/resources/assets.gen.dart';
import 'package:tutapp/ui/theme/color_theme.dart';
import 'package:tutapp/ui/widgets/buttons/tappable_icon.dart';
import 'package:tutapp/ui/widgets/buttons/tappable_text.dart';

class OnboardingBottomSection extends StatelessWidget {
  const OnboardingBottomSection({
    super.key,
    this.itemCount = 0,
    this.currentIndex = 0,
    this.onTapNext,
    this.onTapPrevious,
    this.onTapSkip,
  });

  final int itemCount;
  final int currentIndex;
  final VoidCallback? onTapNext;
  final VoidCallback? onTapPrevious;
  final VoidCallback? onTapSkip;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: ColorTheme.blackWhite.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: TappableText(
              StringsManager.skipAction,
              onTap: onTapSkip,
            ),
          ),
          const Gap(28),
          _CarouselIndicator(
            itemCount: itemCount,
            currentIndex: currentIndex,
            onTapNext: onTapNext,
            onTapPrevious: onTapPrevious,
          ),
        ],
      ),
    );
  }
}

class _CarouselIndicator extends StatelessWidget {
  const _CarouselIndicator({
    required this.itemCount,
    required this.currentIndex,
    this.onTapNext,
    this.onTapPrevious,
  });

  static const _height = 70.0;

  final int itemCount;
  final int currentIndex;
  final VoidCallback? onTapNext;
  final VoidCallback? onTapPrevious;

  @override
  Widget build(BuildContext context) {
    final whiteColor = ColorTheme.blackWhite.shade100;
    const backgroundColor = ColorTheme.orange;

    return Container(
      height: _height,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      color: backgroundColor,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (currentIndex != 0)
            Align(
              alignment: Alignment.centerLeft,
              child: TappableIcon(
                onTap: onTapPrevious,
                icon: Assets.images.arrowLeft.provider(),
                color: whiteColor,
              ),
            ),
          ListView.separated(
            itemCount: itemCount,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const Gap(20),
            itemBuilder: (context, index) => _CarouselIndicatorDot(
              active: currentIndex == index,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TappableIcon(
              onTap: onTapNext,
              icon: Assets.images.arrowRight.provider(),
              color: whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _CarouselIndicatorDot extends StatelessWidget {
  const _CarouselIndicatorDot({
    this.active = false,
  });

  static const size = Size(10, 10);
  static const borderWidth = 1.5;

  final bool active;

  @override
  Widget build(BuildContext context) {
    final whiteColor = ColorTheme.blackWhite.shade100;

    return Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
        color: active ? Colors.transparent : whiteColor,
        shape: BoxShape.circle,
        border: Border.all(
          color: whiteColor,
          width: active ? borderWidth : 0,
        ),
      ),
    );
  }
}
