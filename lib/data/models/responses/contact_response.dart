import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ContactResponse {
  ContactResponse({
    required this.phone,
    required this.name,
    required this.email,
  });

  @JsonKey(name: 'phone')
  final int phone;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'email')
  final String email;
}
