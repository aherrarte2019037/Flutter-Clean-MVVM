import 'package:json_annotation/json_annotation.dart';
import 'package:tutapp/data/models/base_response.dart';
import 'package:tutapp/data/models/contact_response.dart';
import 'package:tutapp/data/models/user_response.dart';
import 'package:tutapp/domain/models/login_result.dart';
part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse extends BaseResponse {
  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

  const LoginResponse({
    required super.status,
    required super.message,
    required this.user,
    required this.contacts,
  });

  @JsonKey(name: 'user')
  final UserResponse user;

  @JsonKey(name: 'contacts', defaultValue: [])
  final List<ContactResponse> contacts;

  @override
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

  LoginResult toDomain() => LoginResult(
        status: status,
        message: message,
        user: user.toDomain(),
        contacts: ContactResponse.toListDomain(contacts),
      );
}
