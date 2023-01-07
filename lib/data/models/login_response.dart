import 'package:json_annotation/json_annotation.dart';
import 'package:tutapp/data/models/contact_response.dart';
import 'package:tutapp/data/models/user_response.dart';
import 'package:tutapp/domain/models/login_result.dart';
import 'package:tutapp/features/login/domain/login_failure.dart';
part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

  const LoginResponse({
    required this.user,
    required this.contacts,
    this.failureType,
  });

  @JsonKey(name: 'failureType')
  final LoginFailureType? failureType;

  @JsonKey(name: 'user')
  final UserResponse user;

  @JsonKey(name: 'contacts', defaultValue: [])
  final List<ContactResponse> contacts;

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

  LoginResult toDomain() => LoginResult(
        user: user.toDomain(),
        contacts: ContactResponse.toListDomain(contacts),
      );
}
