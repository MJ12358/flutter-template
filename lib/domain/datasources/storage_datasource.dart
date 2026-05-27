import 'dart:io';

abstract interface class StorageDataSource {
  Future<Directory> get applicationDirectory;
  Future<Directory> get downloadDirectory;
  Future<Directory> get mediaDirectory;
}
