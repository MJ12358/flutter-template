import 'dart:io';

import 'package:flutter_template/domain/core/database.dart' as domain;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class SembastDatabase implements domain.Database {
  static const String databaseName = 'sembast.db';
  static const int databaseVersion = 1;

  late Database _db;

  @override
  Future<void> init() async {
    disableSembastCooperator();

    final Directory dir = await getApplicationSupportDirectory();
    final DatabaseFactory dbFactory = databaseFactoryIo;

    _db = await dbFactory.openDatabase(
      join(dir.path, databaseName),
      version: databaseVersion,
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
}
