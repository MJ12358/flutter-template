import 'dart:io';

import 'package:flutter_template/domain/core/local_database.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';

class SembastDatabase implements LocalDatabase<Database> {
  static const String _databaseName = 'sembast.db';
  static const int _databaseVersion = 1;

  late Database? _db;

  Future<String> get _databasePath async {
    final Directory dir = await getApplicationSupportDirectory();
    return join(dir.path, _databaseName);
  }

  @override
  Future<SembastDatabase> init() async {
    disableSembastCooperator();
    _db = await databaseFactoryIo.openDatabase(
      await _databasePath,
      version: _databaseVersion,
      onVersionChanged: _onVersionChanged,
    );
    enableSembastCooperator();
    return this;
  }

  @override
  Database get db => _db!;

  Future<void> _onVersionChanged(
    Database db,
    int oldVersion,
    int newVersion,
  ) async {
    if (oldVersion == 0) {
      // new database load defaults
    }
  }
}
