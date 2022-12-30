import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tutapp/domain/models/failure.dart';
import 'package:tutapp/domain/models/local_storage_item.dart';
import 'package:tutapp/utils/extensions/either_extension.dart';

abstract class LocalStorageRepository {
  Future<Either<Failure, Unit>> save({
    required LocalStorageItem<dynamic> item,
  });

  Future<Either<Failure, T?>> read<T>({
    required LocalStorageItem<T> item,
  });
}

class LocalStorageRepositoryImpl implements LocalStorageRepository {
  const LocalStorageRepositoryImpl(
    this._localStorage,
  );

  final FlutterSecureStorage _localStorage;

  @override
  Future<Either<Failure, T?>> read<T>({
    required LocalStorageItem<T> item,
  }) async {
    try {
      final data = await _localStorage.read(key: item.key.value);
      if (data == null) {
        return success(item.defaultValue);
      }

      final T result = jsonDecode(data);
      return success(result);
    } catch (e) {
      return failure(Failure.handle(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> save({
    required LocalStorageItem<dynamic> item,
  }) async {
    try {
      if (item.data == null) {
        await _localStorage.write(
          key: item.key.value,
          value: null,
        );
      } else {
        await _localStorage.write(
          key: item.key.value,
          value: jsonEncode(item.data),
        );
      }

      return success(unit);
    } catch (e) {
      return failure(Failure.handle(e));
    }
  }
}
