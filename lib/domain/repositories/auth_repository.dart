import 'package:dartz/dartz.dart';
import 'package:tutapp/data/internet_status.dart';
import 'package:tutapp/data/sources/auth_data_source.dart';
import 'package:tutapp/domain/models/failure.dart';
import 'package:tutapp/domain/models/login_credentials.dart';
import 'package:tutapp/domain/models/login_result.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginResult>> login({
    required LoginCredentials credentials,
  });
}

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(
    this._authDataSource,
    this._internetStatus,
  );

  final AuthDataSource _authDataSource;
  final InternetStatus _internetStatus;

  @override
  Future<Either<Failure, LoginResult>> login({
    required LoginCredentials credentials,
  }) async {
    final bool isConnected = await _internetStatus.isConnected;
    if (!isConnected) return const Left(Failure(code: 409, message: 'Check your internet connection'));

    final response = await _authDataSource.login(credentials);
    if (response.status != 0) return const Left(Failure(code: 500, message: 'Server error'));

    return Right(response.toDomain());
  }
}
