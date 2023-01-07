import 'package:tutapp/domain/models/contact.dart';
import 'package:tutapp/domain/models/user.dart';

class LoginResult {
  const LoginResult({
    required this.user,
    required this.contacts,
  });

  final User user;
  final List<Contact> contacts;
}
