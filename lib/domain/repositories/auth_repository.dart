import 'package:dartz/dartz.dart';
import 'package:tutapp/domain/models/failure.dart';
import 'package:tutapp/domain/models/login_credentials.dart';
import 'package:tutapp/domain/models/login_result.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginResult>> login({
    required LoginCredentials credentials,
  });
}
