import 'package:tutapp/localization/strings_manager.dart';
import 'package:tutapp/validators/value_validator.dart';

class PasswordValidator implements ValueValidator {
  static const _minimumlength = 8;

  @override
  PasswordValidatorResult validate(String value) {
    value = value.trim();

    if (value.isEmpty) return PasswordValidatorResult.emptyField;
    if (value.length < _minimumlength) return PasswordValidatorResult.tooShort;

    return PasswordValidatorResult.success;
  }
}

enum PasswordValidatorResult implements ValidationResult {
  success(),
  emptyField(message: StringsManager.emptyFieldError),
  tooShort(message: StringsManager.tooShortFieldError);

  const PasswordValidatorResult({this.message = ''});

  final String message;

  bool get isSuccess => this == PasswordValidatorResult.success;
}
