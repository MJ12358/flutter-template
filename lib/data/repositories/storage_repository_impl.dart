import 'dart:io';

import 'package:dart_extensionz/dart_extensionz.dart';
import 'package:flutter_template/domain/datasources/storage_datasource.dart';
import 'package:flutter_template/domain/enums/file.dart';
import 'package:flutter_template/domain/exceptions/unimplemented_exception.dart';
import 'package:flutter_template/domain/repositories/storage_repository.dart';

class StorageRepositoryImpl implements StorageRepository {
  const StorageRepositoryImpl({
    required this._androidDataSource,
    required this._iosDataSource,
  });

  final StorageDataSource _androidDataSource;
  final StorageDataSource _iosDataSource;

  @override
  Future<Directory> getDirectory({
    required FileLocation location,
  }) async {
    switch (location) {
      case FileLocation.application:
        return _getApplicationDirectory();
      case FileLocation.downloads:
        return _getDownloadDirectory();
      case FileLocation.media:
        return _getMediaDirectory();
    }
  }

  Future<Directory> _getApplicationDirectory() async {
    switch (PlatformExtension.target) {
      case TargetPlatform.android:
        return _androidDataSource.applicationDirectory;
      case TargetPlatform.iOS:
        return _iosDataSource.applicationDirectory;
      default:
        throw UnimplementedException.platform();
    }
  }

  Future<Directory> _getDownloadDirectory() async {
    switch (PlatformExtension.target) {
      case TargetPlatform.android:
        return _androidDataSource.downloadDirectory;
      case TargetPlatform.iOS:
        return _iosDataSource.downloadDirectory;
      default:
        throw UnimplementedException.platform();
    }
  }

  Future<Directory> _getMediaDirectory() async {
    switch (PlatformExtension.target) {
      case TargetPlatform.android:
        return _androidDataSource.mediaDirectory;
      case TargetPlatform.iOS:
        return _iosDataSource.mediaDirectory;
      default:
        throw UnimplementedException.platform();
    }
  }
}
