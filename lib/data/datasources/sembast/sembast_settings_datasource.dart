import 'package:flutter_template/data/datasources/sembast/sembast_database.dart';
import 'package:flutter_template/data/models/sembast/sembast_settings_model.dart';
import 'package:flutter_template/domain/datasources/settings_datasource.dart';
import 'package:flutter_template/domain/entities/settings.dart';
import 'package:sembast/sembast.dart';

class SembastSettingsDataSource implements SettingsDataSource {
  SembastSettingsDataSource({
    required SembastDatabase database,
  }) : _db = database.db;

  final Database _db;

  static const String storeName = 'settings';
  static StoreRef<int, Map<String, Object?>> get _store =>
      intMapStoreFactory.store(storeName);

  @override
  Stream<Settings> get() {
    return _store
        .record(0)
        .onSnapshot(_db)
        .map(SembastSettingsModel.fromRecord);
  }

  @override
  Future<void> set({
    required Settings settings,
  }) async {
    final Map<String, Object?> data = SembastSettingsModel.fromEntity(
      settings,
    ).toMap();
    await _store.record(0).put(_db, data);
  }
}
