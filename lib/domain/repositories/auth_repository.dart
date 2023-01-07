import 'package:dartz/dartz.dart';
import 'package:tutapp/data/sources/connection_status.dart';
import 'package:tutapp/data/sources/auth_data_source.dart';
import 'package:tutapp/domain/models/login_params.dart';
import 'package:tutapp/domain/models/login_result.dart';
import 'package:tutapp/features/login/domain/login_failure.dart';
import 'package:tutapp/utils/extensions/either_extension.dart';

abstract class AuthRepository {
  Future<Either<LoginFailure, LoginResult>> login({
    required LoginParams params,
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
  Future<Either<LoginFailure, LoginResult>> login({
    required LoginParams params,
  }) async {
    final bool isConnected = await _connectionStatus.isConnected;
    if (!isConnected) return failure(LoginFailure.noConnection());

    try {
      final response = await _authDataSource.login(params);
      final failureType = response.failureType;

      if (failureType != null) {
        return failure(LoginFailure(type: failureType));
      }

      return success(response.toDomain());
    } catch (e) {
      return failure(LoginFailure.unknown(error: e));
    }
  }
}
