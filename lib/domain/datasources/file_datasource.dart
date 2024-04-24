import 'dart:async';
import 'dart:io';

abstract class FileDataSource {
  FutureOr<Directory> get applicationDirectory;
  FutureOr<Directory> get downloadDirectory;
}
