import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tutapp/domain/models/local_storage_key.dart';
import 'package:tutapp/utils/type_defs.dart';

abstract class LocalStorageRepository {
  Future<Unit> save({
    required LocalStorageKey key,
    required dynamic data,
  });

  Future<T> read<T>({
    required LocalStorageKey key,
    T defaultValue,
    EnumDecoder<T>? enumDecoder,
  });

  Future<bool> containsKey({
    required LocalStorageKey key,
  });
}

class LocalStorageRepositoryImpl implements LocalStorageRepository {
  const LocalStorageRepositoryImpl();

  final _localStorage = const FlutterSecureStorage();

  @override
  Future<T> read<T>({
    required LocalStorageKey key,
    dynamic defaultValue,
    EnumDecoder<T>? enumDecoder,
  }) async {
    final data = await _localStorage.read(key: key.value);
    if (data == null) {
      return defaultValue;
    }

    final decoded = jsonDecode(data);

    if (enumDecoder != null) {
      return enumDecoder(decoded);
    }
    T result = decoded;
    return result;
  }

  @override
  Future<Unit> save({
    required LocalStorageKey key,
    required dynamic data,
  }) async {
    if (data != null) {
      data = jsonEncode(data);
    }
    await _localStorage.write(
      key: key.value,
      value: data,
    );

    return unit;
  }

  @override
  Future<bool> containsKey({
    required LocalStorageKey key,
  }) async {
    final contains = await _localStorage.containsKey(key: key.value);
    return contains;
  }
}
