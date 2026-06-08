import 'dart:io';

import 'package:flutter_template/domain/core/local_database.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';

class SembastDatabase implements LocalDatabase<Database> {
  static const String _databaseName = 'sembast.db';
  static const int _databaseVersion = 1;

  late Database _db;

  static DatabaseFactory get _databaseFactory {
    return databaseFactoryIo;
  }

  Future<String> get _databasePath async {
    final Directory dir = await getApplicationSupportDirectory();
    return join(dir.path, _databaseName);
  }

  @override
  Future<SembastDatabase> init() async {
    disableSembastCooperator();
    _db = await _databaseFactory.openDatabase(
      await _databasePath,
      version: _databaseVersion,
      onVersionChanged: _onVersionChanged,
    );
    enableSembastCooperator();
    return this;
  }

  @override
  Future<void> close() async {
    await _db.close();
  }

  @override
  Database get db => _db;

  Future<void> _onVersionChanged(
    Database db,
    int oldVersion,
    int newVersion,
  ) async {
    if (oldVersion == 0) {
      // https://github.com/tekartik/sembast.dart/blob/master/sembast/doc/open.md#preloading-data
    }
  }
}
