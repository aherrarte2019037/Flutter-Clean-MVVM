import 'package:tutapp/domain/models/id.dart';

class User {
  const User({
    required this.id,
    required this.name,
    required this.notificationsCount,
    required this.email,
  });
  
  final Id id;
  final String name;
  final int notificationsCount;
  final String email;
}
