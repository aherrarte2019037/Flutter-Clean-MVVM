import 'package:tutapp/localization/strings_manager.dart';
import 'package:tutapp/validators/value_validator.dart';

class PasswordValidator implements ValueValidator {
  static const _minimumlength = 8;

  @override
  PasswordValidationResult validate(String value) {
    value = value.trim();

    if (value.isEmpty) return PasswordValidationResult.emptyField;
    if (value.length < _minimumlength) return PasswordValidationResult.tooShort;

    return PasswordValidationResult.success;
  }
}

enum PasswordValidationResult implements ValidationResult {
  success(),
  emptyField(message: StringsManager.emptyFieldError),
  tooShort(message: StringsManager.tooShortFieldError);

  const PasswordValidationResult({this.message = ''});

  final String message;

  bool get isSuccess => this == PasswordValidationResult.success;
}
