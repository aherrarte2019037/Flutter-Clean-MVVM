import 'package:flutter/material.dart';
import 'package:tutapp/features/onboarding/onboarding_presentation_model.dart';
import 'package:tutapp/features/onboarding/onboarding_presenter.dart';
import 'package:tutapp/features/onboarding/widgets/onboarding_bottom_section.dart';
import 'package:tutapp/features/onboarding/widgets/onboarding_page.dart';
import 'package:tutapp/ui/theme/color_theme.dart';
import 'package:tutapp/ui/widgets/status_bar/dark_status_bar.dart';
import 'package:tutapp/utils/extensions/bloc_extensions.dart';
import 'package:tutapp/utils/durations.dart';

class OnboardingCarousel extends StatefulWidget with HasPresenter<OnboardingPresenter> {
  const OnboardingCarousel({
    super.key,
    required this.presenter,
  });

  @override
  final OnboardingPresenter presenter;

  @override
  State<OnboardingCarousel> createState() => _OnboardingCarouselState();
}

class _OnboardingCarouselState extends State<OnboardingCarousel>
    with PresenterState<OnboardingViewModel, OnboardingPresenter, OnboardingCarousel> {
  late PageController _pageController;

  static const animatonCurve = Curves.ease;
  static const animationDuration = ShortDuration();

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  void _onTapNext(OnboardingViewModel state) {
    _pageController.animateToPage(
      state.onLastItem ? state.carouselIndex : state.carouselIndex + 1,
      duration: animationDuration,
      curve: animatonCurve,
    );
    presenter.onTapNextPage();
  }

  void _onTapPrevious(OnboardingViewModel state) {
    _pageController.animateToPage(
      state.carouselIndex == 0 ? 0 : state.carouselIndex - 1,
      duration: animationDuration,
      curve: animatonCurve,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DarkStatusBar(
      child: Scaffold(
        backgroundColor: ColorTheme.blackWhite.shade100,
        body: SafeArea(
          child: stateObserver(
            builder: (context, state) => PageView.builder(
              controller: _pageController,
              itemCount: state.carouselItemCount,
              onPageChanged: presenter.onPageChanged,
              itemBuilder: (_, index) => OnboardingPage(
                item: state.carouselItems[index],
              ),
            ),
          ),
        ),
        bottomSheet: stateObserver(
          builder: (context, state) => OnboardingBottomSection(
            itemCount: state.carouselItemCount,
            currentIndex: state.carouselIndex,
            onTapNext: () => _onTapNext(state),
            onTapPrevious: () => _onTapPrevious(state),
            onTapSkip: presenter.onTapSkip,
          ),
        ),
      ),
    );
  }
}
