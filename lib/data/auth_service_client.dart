import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tutapp/data/models/responses/login_response.dart';
part 'auth_service_client.g.dart';

@RestApi(baseUrl: 'https://flutterclean.wiremockapi.cloud/')
abstract class AuthServiceClient {
  factory AuthServiceClient(Dio dio, {required String baseUrl}) = _AuthServiceClient;

  @POST('/auth/login')
  Future<LoginResponse> login();
}
