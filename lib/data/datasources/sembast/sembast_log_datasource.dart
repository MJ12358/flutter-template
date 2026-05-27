import 'package:flutter_template/data/datasources/sembast/sembast_database.dart';
import 'package:flutter_template/data/extensions/sembast/sembast_extension.dart';
import 'package:flutter_template/data/models/sembast/sembast_log_model.dart';
import 'package:flutter_template/domain/datasources/log_datasource.dart';
import 'package:flutter_template/domain/entities/log.dart';
import 'package:sembast/sembast.dart';

class SembastLogDataSource implements LogDataSource {
  SembastLogDataSource({
    required SembastDatabase database,
  }) : _db = database.db;

  final Database _db;

  static const String storeName = 'log';
  static StoreRef<int, Map<String, Object?>> get _store =>
      intMapStoreFactory.store(storeName);

  @override
  Stream<List<SembastLogModel>> get({
    DateTime? start,
  }) {
    Finder finder = Finder();
    if (start != null) {
      finder = Finder(
        filter: Filter.greaterThanOrEquals(
          SembastLogModel.keyTimestamp,
          start.toTimestamp(),
        ),
      );
    }
    return _store
        .query(finder: finder)
        .onSnapshots(_db)
        .map(SembastLogModel.fromQuery);
  }

  @override
  Future<void> set({
    required Log log,
  }) {
    final SembastLogModel model = SembastLogModel.fromEntity(log);
    return _store.add(_db, model.toMap());
  }

  @override
  Future<void> clear({
    LogLevel? level,
  }) {
    if (level == null) {
      return _store.delete(_db);
    }
    final Filter filter = Filter.equals(
      SembastLogModel.keyLevel,
      level.name,
    );
    final Finder finder = Finder(filter: filter);
    return _store.delete(_db, finder: finder);
  }
}
