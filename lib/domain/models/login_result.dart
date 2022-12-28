import 'package:tutapp/domain/models/contact.dart';
import 'package:tutapp/domain/models/user.dart';

class LoginResult {
  const LoginResult({
    required this.status,
    required this.message,
    required this.user,
    required this.contacts,
  });

  final int status;
  final String message;
  final User user;
  final List<Contact> contacts;
}
