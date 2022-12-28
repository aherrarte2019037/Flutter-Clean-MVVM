import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tutapp/data/models/responses/login_response.dart';
part 'auth_service.g.dart';

@RestApi(baseUrl: 'https://flutterclean.wiremockapi.cloud/')
abstract class AuthService {
  factory AuthService(Dio dio, {required String baseUrl}) = _AuthService;

  @POST('/auth/login')
  // ignore: long-parameter-list
  Future<LoginResponse> login({
    @Field('email') required String email,
    @Field('password') required String password,
    @Field('imei') required String imei,
    @Field('devicePlatform') required String devicePlatform,
    @Field('deviceType') required String deviceType,
  });
}
