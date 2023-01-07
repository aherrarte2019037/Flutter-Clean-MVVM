import 'package:json_annotation/json_annotation.dart';
import 'package:tutapp/domain/models/visible_failure.dart';
import 'package:tutapp/localization/strings_manager.dart';

class LoginFailure implements DisplayVisibleFailure {
  LoginFailure({
    required this.type,
    this.error,
  });

  LoginFailure.unknown({
    this.error,
  }) : type = LoginFailureType.unknown;

  LoginFailure.noConnection({
    this.error,
  }) : type = LoginFailureType.noConnection;

  final LoginFailureType type;
  final dynamic error;

  @override
  VisibleFailure get visible {
    switch (type) {
      case LoginFailureType.unknown:
        return VisibleFailure.unknown();

      case LoginFailureType.wrongPassword:
        return VisibleFailure(
          title: StringsManager.commonErrorTitle,
          message: StringsManager.wrongPasswordError,
        );

      case LoginFailureType.notRegistered:
        return VisibleFailure(
          title: StringsManager.commonErrorTitle,
          message: StringsManager.notRegisteredError,
        );
      case LoginFailureType.noConnection:
        return VisibleFailure.noConnection();
    }
  }
}

@JsonEnum()
enum LoginFailureType {
  unknown,
  wrongPassword,
  notRegistered,
  noConnection,
}
