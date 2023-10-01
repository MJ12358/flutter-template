import 'dart:convert';
import 'dart:io';

import 'package:flutter_template/domain/core/database.dart' as domain;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:sembast/utils/sembast_import_export.dart';

class SembastDatabase implements domain.Database {
  static const String _databaseName = 'sembast.db';
  static const int _databaseVersion = 1;

  late Database _db;

  DatabaseFactory get _dbFactory => databaseFactoryIo;

  @override
  Future<void> init() async {
    disableSembastCooperator();

    final Directory dir = await getApplicationSupportDirectory();

    _db = await _dbFactory.openDatabase(
      join(dir.path, _databaseName),
      version: _databaseVersion,
      onVersionChanged: (Database db, int oldVersion, int newVersion) async {
        if (oldVersion == 0) {
          // https://github.com/tekartik/sembast.dart/blob/master/sembast/doc/open.md#preloading-data
        }
      },
    );

    enableSembastCooperator();
  }

  @override
  Database get db => _db;

  @override
  Future<String> export() async {
    final Map<String, Object?> content = await exportDatabase(db);
    return json.encode(content);
  }

  @override
  Future<void> import({
    required String data,
  }) async {
    await _db.close();
    final Map<Object?, Object?> content =
        json.decode(data) as Map<Object?, Object?>;
    await importDatabase(content, _dbFactory, _databaseName);
    await init();
  }
}
