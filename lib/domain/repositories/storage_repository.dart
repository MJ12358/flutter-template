import 'dart:io';

import 'package:flutter_template/domain/enums/file.dart';

abstract interface class StorageRepository {
  Future<Directory> getDirectory({
    required FileLocation location,
  });
}
