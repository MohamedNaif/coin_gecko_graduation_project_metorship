import 'package:coin_gecko_graduation_project_metorship/core/constants/storage_keys.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@singleton
class SecureStorageServices {
  final FlutterSecureStorage _secureStorage;

  SecureStorageServices(this._secureStorage);

  
  Future<void> saveBiometricEnabled(bool enabled) async {
    await _secureStorage.write(
      key: StorageKeys.biometricEnabled,
      value: enabled.toString(),
    );
  }

  Future<bool> isBiometricEnabled() async {
    final value = await _secureStorage.read(key: StorageKeys.biometricEnabled);
    return value == 'true';
  }

  Future<void> clearAll() async {
    await _secureStorage.deleteAll();
  }
}
