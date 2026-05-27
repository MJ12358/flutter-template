import 'dart:io';

import 'package:external_path/external_path.dart';
import 'package:flutter_template/domain/datasources/storage_datasource.dart';
import 'package:path_provider/path_provider.dart';

class IOSStorageDataSource implements StorageDataSource {
  @override
  Future<Directory> get applicationDirectory {
    return getApplicationDocumentsDirectory();
  }

  @override
  Future<Directory> get downloadDirectory async {
    final String path = await ExternalPath.getExternalStoragePublicDirectory(
      ExternalPath.DIRECTORY_DOWNLOAD,
    );
    final Directory dir = Directory(path);
    if (dir.existsSync()) {
      return dir;
    }
    return getApplicationDocumentsDirectory();
  }

  @override
  Future<Directory> get mediaDirectory async {
    final String path = await ExternalPath.getExternalStoragePublicDirectory(
      ExternalPath.DIRECTORY_LIBRARY,
    );
    final Directory dir = Directory(path);
    if (dir.existsSync()) {
      return dir;
    }
    return getLibraryDirectory();
  }
}
