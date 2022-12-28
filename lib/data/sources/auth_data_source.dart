import 'package:tutapp/data/models/responses/login_response.dart';
import 'package:tutapp/data/services/auth_service_client.dart';
import 'package:tutapp/domain/models/login_credentials.dart';

abstract class AuthDataSource {
  Future<LoginResponse> login(LoginCredentials credentials);
}

class AuthDataSourceImplementer implements AuthDataSource {
  const AuthDataSourceImplementer({
    required this.authService,
  });

  final AuthServiceClient authService;

  @override
  Future<LoginResponse> login(LoginCredentials credentials) async {
    return await authService.login(
      devicePlatform: credentials.devicePlatform,
      deviceType: credentials.deviceType,
      email: credentials.email,
      imei: credentials.imei,
      password: credentials.password,
    );
  }
}
