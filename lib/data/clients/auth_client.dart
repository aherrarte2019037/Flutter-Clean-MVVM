import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tutapp/data/config/config_constants.dart';
import 'package:tutapp/data/models/login_response.dart';
part 'auth_client.g.dart';

@RestApi(baseUrl: ConfigConstants.baseUrl)
abstract class AuthClient {
  factory AuthClient(Dio dio, {required String baseUrl}) = _AuthClient;

  @POST('/auth/login')
  // ignore: long-parameter-list
  Future<LoginResponse> login({
    @Field('email') required String email,
    @Field('password') required String password,
    @Field('deviceIdentifier') required String deviceIdentifier,
    @Field('devicePlatform') required String devicePlatform,
    @Field('deviceType') required String deviceType,
  });
}
