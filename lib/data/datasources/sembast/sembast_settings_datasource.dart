import 'package:flutter_template/data/models/sembast/sembast_settings_model.dart';
import 'package:flutter_template/domain/core/database.dart' as domain;
import 'package:flutter_template/domain/datasources/settings_datasource.dart';
import 'package:flutter_template/domain/entities/settings.dart';
import 'package:sembast/sembast.dart';

class SembastSettingsDataSource implements SettingsDataSource {
  SembastSettingsDataSource({
    required domain.Database database,
  }) : _database = database.db as Database;

  final Database _database;

  static const String _storeName = 'settings';

  static final StoreRef<int, Map<String, Object?>> _store =
      intMapStoreFactory.store(_storeName);

  @override
  Stream<Settings> get() {
    return _store
        .record(0)
        .onSnapshot(_database)
        .map(SembastSettingsModel.fromRecord);
  }

  @override
  Future<void> set({
    required Settings settings,
  }) async {
    final Map<String, Object?> data =
        SembastSettingsModel.fromEntity(settings).toMap();

    await _store.record(0).put(_database, data);
  }
}
