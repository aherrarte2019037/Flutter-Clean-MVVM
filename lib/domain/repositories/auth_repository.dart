import 'package:dartz/dartz.dart';
import 'package:tutapp/data/config/connection_status.dart';
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
    this._connectionStatus,
  );

  final AuthDataSource _authDataSource;
  final ConnectionStatus _connectionStatus;

  @override
  Future<Either<Failure, LoginResult>> login({
    required LoginCredentials credentials,
  }) async {
    final bool isConnected = await _connectionStatus.isConnected;
    if (!isConnected) return Left(Failure.notConnected());

    try {
      final response = await _authDataSource.login(credentials);
      return Right(response.toDomain());
    } catch (e) {
      return Left(Failure.handle(e));
    }
  }
}
