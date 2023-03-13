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
  static const String storeName = 'settings';

  StoreRef<int, Map<String, Object?>> get _store =>
      intMapStoreFactory.store(storeName);

  @override
  Stream<Settings> get() {
    final RecordRef<int, Map<String, Object?>> record = _store.record(0);
    return record.onSnapshot(_database).map(SembastSettingsModel.fromRecord);
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
