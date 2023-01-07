import 'package:tutapp/localization/strings_manager.dart';

class VisibleFailure {
  VisibleFailure({
    this.title = StringsManager.commonErrorTitle,
    required this.message,
  });

  VisibleFailure.unknown({
    String? message,
  })  : title = StringsManager.unknownErrorTitle,
        message = message ?? StringsManager.unknownErrorMessage;

  VisibleFailure.noConnection({
    String? message,
  })  : title = StringsManager.commonErrorTitle,
        message = message ?? StringsManager.notConnectedNetworkError;

  final String title;
  final String message;
}

abstract class DisplayVisibleFailure {
  VisibleFailure get visible;
}
