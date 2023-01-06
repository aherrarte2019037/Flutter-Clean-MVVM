import 'package:tutapp/domain/models/page_params.dart';

class LoginPageParams implements PageParams {
  const LoginPageParams({
    this.swipeAnimate = true,
  });

  final bool swipeAnimate;
}
