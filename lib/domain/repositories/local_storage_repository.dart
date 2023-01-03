import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tutapp/domain/models/local_storage_key.dart';

abstract class LocalStorageRepository {
  Future<Unit> save({
    required LocalStorageKey key,
    required dynamic data,
  });

  Future<T> read<T>({
    required LocalStorageKey key,
    T defaultValue,
  });
}

class LocalStorageRepositoryImpl implements LocalStorageRepository {
  const LocalStorageRepositoryImpl();

  final _localStorage = const FlutterSecureStorage();

  @override
  Future<T> read<T>({
    required LocalStorageKey key,
    dynamic defaultValue,
  }) async {
    final data = await _localStorage.read(key: key.value);
    if (data == null) {
      return defaultValue;
    }

    final T result = jsonDecode(data);
    return result;
  }

  @override
  Future<Unit> save({
    required LocalStorageKey key,
    required dynamic data,
  }) async {
    data = data ?? jsonEncode(data);
    await _localStorage.write(
      key: key.value,
      value: data,
    );

    return unit;
  }
}
