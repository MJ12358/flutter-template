import 'dart:convert';
import 'dart:io';

import 'package:flutter_template/core/constants.dart';
import 'package:flutter_template/domain/core/database.dart' as domain;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:sembast/utils/sembast_import_export.dart';
import 'package:sembast_web/sembast_web.dart';

class SembastDatabase implements domain.Database {
  static const String _databaseName = 'sembast.db';
  static const int _databaseVersion = 1;

  late Database _db;

  DatabaseFactory get _dbFactory {
    if (Build.isWeb) {
      return databaseFactoryWeb;
    } else {
      return databaseFactoryIo;
    }
  }

  Future<String> get _path async {
    final Directory dir;
    if (Build.isWeb) {
      dir = Directory('/assets/db');
    } else {
      dir = await getApplicationSupportDirectory();
    }
    return join(dir.path, _databaseName);
  }

  @override
  Future<void> init() async {
    disableSembastCooperator();

    _db = await _dbFactory.openDatabase(
      await _path,
      version: _databaseVersion,
      onVersionChanged: (Database db, int oldVersion, int newVersion) async {
        // database is new, load default values
        if (oldVersion == 0) {
          // https://github.com/tekartik/sembast.dart/blob/master/sembast/doc/open.md#preloading-data
        }
        // upgrade from v1 to v2
        if (oldVersion == 1 && newVersion >= 2) {}
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
    await importDatabase(content, _dbFactory, await _path);
    await init();
  }
}
