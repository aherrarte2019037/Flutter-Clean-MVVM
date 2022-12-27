import 'package:json_annotation/json_annotation.dart';
part 'contact_response.g.dart';

@JsonSerializable()
class ContactResponse {
  factory ContactResponse.fromJson(Map<String, dynamic> json) => _$ContactResponseFromJson(json);

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

  Map<String, dynamic> toJson() => _$ContactResponseToJson(this);
}
