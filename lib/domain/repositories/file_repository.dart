import 'dart:typed_data';

import 'package:flutter_template/domain/enums/file.dart';

abstract class FileRepository {
  Future<Uint8List?> pick({
    FileSource? source,
  });
  Future<void> write({
    required Object value,
    required String name,
    required FileLocation location,
  });
}
