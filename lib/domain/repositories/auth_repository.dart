import 'package:dartz/dartz.dart';
import 'package:tutapp/data/config/connection_status.dart';
import 'package:tutapp/data/sources/auth_data_source.dart';
import 'package:tutapp/domain/models/failure.dart';
import 'package:tutapp/domain/models/login_params.dart';
import 'package:tutapp/domain/models/login_result.dart';
import 'package:tutapp/utils/extensions/either_extension.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginResult>> login({
    required LoginParams credentials,
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
    required LoginParams credentials,
  }) async {
    final bool isConnected = await _connectionStatus.isConnected;
    if (!isConnected) return failure(Failure.notConnected());

    try {
      final response = await _authDataSource.login(credentials);
      return success(response.toDomain());
    } catch (e) {
      return failure(Failure.handle(e));
    }
  }
}
