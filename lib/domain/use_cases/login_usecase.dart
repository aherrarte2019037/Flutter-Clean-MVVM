import 'package:tutapp/domain/models/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:tutapp/domain/models/login_params.dart';
import 'package:tutapp/domain/models/login_result.dart';
import 'package:tutapp/domain/repositories/auth_repository.dart';
import 'package:tutapp/domain/use_cases/base_usecase.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, LoginResult> {
  LoginUseCase(
    this._authRepository,
  );

  final AuthRepository _authRepository;

  @override
  Future<Either<Failure, LoginResult>> execute(
    LoginUseCaseInput input,
  ) async {
    await _authRepository.login(
      params: LoginParams(
        email: input.email,
        password: input.password,
        deviceIdentifier: deviceIdentifier,
        devicePlatform: devicePlatform,
        deviceType: deviceType,
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
