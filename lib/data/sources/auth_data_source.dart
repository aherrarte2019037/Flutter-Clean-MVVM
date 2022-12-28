import 'package:tutapp/data/models/responses/login_response.dart';
import 'package:tutapp/data/services/auth_service.dart';
import 'package:tutapp/domain/models/login_credentials.dart';

abstract class AuthDataSource {
  Future<LoginResponse> login(LoginCredentials credentials);
}

class AuthDataSourceImpl implements AuthDataSource {
  const AuthDataSourceImpl({
    required this.authService,
  });

  final AuthService authService;

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
