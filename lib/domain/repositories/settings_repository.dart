import 'package:flutter_template/domain/entities/settings.dart';

abstract interface class SettingsRepository {
  Stream<Settings> get();
  Future<void> set({
    required Settings settings,
  });
}
