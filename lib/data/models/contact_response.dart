import 'package:json_annotation/json_annotation.dart';
import 'package:tutapp/domain/models/contact.dart';
part 'contact_response.g.dart';

@JsonSerializable()
class ContactResponse {
  factory ContactResponse.fromJson(Map<String, dynamic> json) => _$ContactResponseFromJson(json);

  const ContactResponse({
    required this.phone,
    required this.name,
    required this.email,
  });

  @JsonKey(name: 'phone', defaultValue: 0)
  final int phone;

  @JsonKey(name: 'name', defaultValue: '')
  final String name;

  @JsonKey(name: 'email', defaultValue: '')
  final String email;

  Map<String, dynamic> toJson() => _$ContactResponseToJson(this);

  Contact toDomain() => Contact(
        phone: phone,
        name: name,
        email: email,
      );

  static List<Contact> toListDomain(
    List<ContactResponse> list,
  ) =>
      list.map((e) => e.toDomain()).toList();
}
