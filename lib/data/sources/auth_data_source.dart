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
  Future<LoginResponse> login(LoginParams params) async {
    return await authClient.login(
      devicePlatform: params.devicePlatform,
      deviceType: params.deviceType,
      email: params.email,
      deviceIdentifier: params.deviceIdentifier,
      password: params.password,
    );
  }
}
