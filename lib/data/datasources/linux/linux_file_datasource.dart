import 'dart:async';
import 'dart:io';

import 'package:flutter_template/domain/datasources/file_datasource.dart';
import 'package:path_provider/path_provider.dart';

class LinuxFileDataSource implements FileDataSource {
  @override
  FutureOr<Directory> get applicationDirectory =>
      getApplicationDocumentsDirectory();

  @override
  FutureOr<Directory> get downloadDirectory async {
    final Directory? dir = await getDownloadsDirectory();
    if (dir == null) {
      return getApplicationDocumentsDirectory();
    }
    return dir;
  }
}
