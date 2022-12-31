import 'package:tutapp/data/models/login_response.dart';
import 'package:tutapp/data/clients/auth_client.dart';
import 'package:tutapp/domain/models/login_params.dart';

abstract class AuthDataSource {
  Future<LoginResponse> login(LoginParams credentials);
}

class AuthDataSourceImpl implements AuthDataSource {
  const AuthDataSourceImpl({
    required this.authClient,
  });

  final AuthClient authClient;

  @override
  Future<LoginResponse> login(LoginParams credentials) async {
    return await authClient.login(
      devicePlatform: credentials.devicePlatform,
      deviceType: credentials.deviceType,
      email: credentials.email,
      imei: credentials.imei,
      password: credentials.password,
    );
  }
}
