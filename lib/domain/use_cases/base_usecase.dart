import 'package:dartz/dartz.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<dynamic,Out>> execute(In input);
}

abstract class BaseUseCaseOut<Out> {
  Future<Either<dynamic, Out>> execute();
}