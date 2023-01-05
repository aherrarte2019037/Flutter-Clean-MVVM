import 'package:tutapp/localization/strings_manager.dart';
import 'package:tutapp/validators/value_validator.dart';

class EmailValidator implements ValueValidator {
  static final pattern = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
  );

  @override
  EmailValidationResult validate(String value) {
    value = value.trim();

    if (value.isEmpty) return EmailValidationResult.emptyField;
    if (!pattern.hasMatch(value)) return EmailValidationResult.invalid;

    return EmailValidationResult.success;
  }
}

enum EmailValidationResult implements ValidationResult {
  initial(),
  success(),
  emptyField(message: StringsManager.emptyFieldError),
  invalid(message: StringsManager.invalidEmailError);

  const EmailValidationResult({this.message = ''});

  final String message;

  bool get isSuccess => this == EmailValidationResult.success;
}
