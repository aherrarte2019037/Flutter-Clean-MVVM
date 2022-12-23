import 'package:tutapp/features/onboarding/domain/onboarding_item.dart';
import 'package:tutapp/localization/strings_manager.dart';
import 'package:tutapp/resources/assets.gen.dart';

class OnboardingPresentationModel implements OnboardingViewModel {
  OnboardingPresentationModel.initial() : carouselIndex = 0;

  OnboardingPresentationModel._({
    required this.carouselIndex,
  });

  @override
  final int carouselIndex;

  @override
  int get carouselItemCount => carouselItems.length;

  @override
  List<OnboardingItem> get carouselItems => [
        OnboardingItem(
          title: StringsManager.onboardingTitle1,
          subtitle: StringsManager.onboardingSubtitle1,
          image: Assets.images.onboarding1.svg(),
        ),
        OnboardingItem(
          title: StringsManager.onboardingTitle2,
          subtitle: StringsManager.onboardingSubtitle2,
          image: Assets.images.onboarding2.svg(),
        ),
        OnboardingItem(
          title: StringsManager.onboardingTitle3,
          subtitle: StringsManager.onboardingSubtitle3,
          image: Assets.images.onboarding3.svg(),
        ),
        OnboardingItem(
          title: StringsManager.onboardingTitle4,
          subtitle: StringsManager.onboardingSubtitle4,
          image: Assets.images.onboarding4.svg(),
        ),
      ];

  @override
  bool get onLastItem => carouselIndex == carouselItemCount - 1;

  OnboardingPresentationModel copyWith({
    int? carouselIndex,
  }) {
    return OnboardingPresentationModel._(
      carouselIndex: carouselIndex ?? this.carouselIndex,
    );
  }
}

abstract class OnboardingViewModel {
  int get carouselIndex;

  int get carouselItemCount;

  List<OnboardingItem> get carouselItems;

  bool get onLastItem;
}
