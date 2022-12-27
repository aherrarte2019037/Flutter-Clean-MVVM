import 'package:json_annotation/json_annotation.dart';
import 'package:tutapp/data/models/responses/base_response.dart';
import 'package:tutapp/data/models/responses/contact_response.dart';
import 'package:tutapp/data/models/responses/user_response.dart';

@JsonSerializable()
class LoginResponse extends BaseResponse {
  LoginResponse({
    required super.status,
    required super.message,
    required this.user,
    required this.contacts,
  });

  @JsonKey(name: 'user')
  final UserResponse user;

  @JsonKey(name: 'contacts')
  final List<ContactResponse> contacts;
}
