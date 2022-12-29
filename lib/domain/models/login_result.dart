import 'package:tutapp/data/models/server_status_response.dart';
import 'package:tutapp/domain/models/contact.dart';
import 'package:tutapp/domain/models/user.dart';

class LoginResult {
  const LoginResult({
    required this.status,
    required this.message,
    required this.user,
    required this.contacts,
  });

  final ServerStatusResponse status;
  final String message;
  final User user;
  final List<Contact> contacts;
}
