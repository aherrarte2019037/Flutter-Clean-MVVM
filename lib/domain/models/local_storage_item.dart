import 'package:tutapp/domain/models/local_storage_key.dart';

class LocalStorageItem<T> {
  LocalStorageItem({
    required this.key,
    required this.data,
    this.defaultValue,
  });

  final LocalStorageKey key;
  final T data;
  final T? defaultValue;
}
