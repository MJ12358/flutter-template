import 'package:flutter_template/domain/entities/settings.dart';

abstract interface class SettingsDataSource {
  Stream<Settings> get();
  Future<void> set({
    required Settings settings,
  });
}
