import 'package:tutapp/localization/strings_manager.dart';
import 'package:tutapp/validators/value_validator.dart';

class EmailValidator implements ValueValidator {
  static final pattern = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
  );

  @override
  EmailValidatorResult validate(String value) {
    value = value.trim();

    if (value.isEmpty) return EmailValidatorResult.emptyField;
    if (!pattern.hasMatch(value)) return EmailValidatorResult.invalid;

    return EmailValidatorResult.success;
  }
}

enum EmailValidatorResult implements ValidationResult {
  success(),
  emptyField(message: StringsManager.emptyFieldError),
  invalid(message: StringsManager.invalidEmailError);

  const EmailValidatorResult({this.message = ''});

  final String message;

  bool get isSuccess => this == EmailValidatorResult.success;
}
