import 'package:tutapp/domain/models/local_storage_key.dart';
import 'package:tutapp/domain/repositories/local_storage_repository.dart';

class AppInitUseCase {
  AppInitUseCase(
    this._localStorageRepository,
  );

  final LocalStorageRepository _localStorageRepository;

  Future<AppInitResult> execute() async {
    final skippedOnboarding = await _localStorageRepository.read(
      key: LocalStorageKey.skipOnboarding,
      defaultValue: false,
    );

    return AppInitResult(skipOnboarding: skippedOnboarding);
  }
}

class AppInitResult {
  AppInitResult({
    required this.skipOnboarding,
  });

  final bool skipOnboarding;
}
