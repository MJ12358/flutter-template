import 'package:flutter_template/domain/datasources/settings_datasource.dart';
import 'package:flutter_template/domain/entities/settings.dart';
import 'package:flutter_template/domain/repositories/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  const SettingsRepositoryImpl({
    // TODO: figure out how to add the AnalyticsRepo here (circular dependency)
    required SettingsDataSource localDataSource,
  }) : _localDataSource = localDataSource;

  final SettingsDataSource _localDataSource;

  @override
  Stream<Settings> get() {
    return _localDataSource.get();
  }

  @override
  Future<void> set({
    required Settings settings,
  }) {
    return _localDataSource.set(settings: settings);
  }
}
