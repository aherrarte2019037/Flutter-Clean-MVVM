import 'package:tutapp/domain/models/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:tutapp/domain/models/login_params.dart';
import 'package:tutapp/domain/models/login_result.dart';
import 'package:tutapp/domain/repositories/auth_repository.dart';
import 'package:tutapp/domain/repositories/device_info_repository.dart';
import 'package:tutapp/domain/use_cases/base_usecase.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, LoginResult> {
  LoginUseCase(
    this._authRepository,
    this._deviceInfoRepository,
  );

  final AuthRepository _authRepository;
  final DeviceInfoRepository _deviceInfoRepository;

  @override
  Future<Either<Failure, LoginResult>> execute(
    LoginUseCaseInput input,
  ) async {
    final deviceInfo = await _deviceInfoRepository.getInfo();
    return await _authRepository.login(
      params: LoginParams(
        email: input.email,
        password: input.password,
        deviceIdentifier: deviceInfo.identifier,
        devicePlatform: deviceInfo.platform.value,
        deviceName: deviceInfo.name,
      ),
    );
  }
}

class LoginUseCaseInput {
  const LoginUseCaseInput({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}
