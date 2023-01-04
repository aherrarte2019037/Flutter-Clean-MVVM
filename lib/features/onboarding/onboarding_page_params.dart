import 'package:tutapp/domain/models/page_params.dart';

class OnboardingPageParams implements PageParams {
  const OnboardingPageParams({
    this.carouselIndex = 0,
  });

  final int carouselIndex;
}
