import 'package:flutter_template/domain/entities/settings.dart';

abstract class SettingsDataSource {
  Stream<Settings> get();
  Future<void> set({
    required Settings settings,
  });
}
