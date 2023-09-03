import 'dart:io';

import 'package:dart_extensionz/dart_extensionz.dart';
import 'package:flutter_template/domain/datasources/permission_datasource.dart';
import 'package:flutter_template/domain/exceptions/platform_not_supported_exception.dart';
import 'package:flutter_template/domain/repositories/permission_repository.dart';

class PermissionRepositoryImpl implements PermissionRepository {
  const PermissionRepositoryImpl({
    required PermissionDataSource androidDataSource,
    required PermissionDataSource iosDataSource,
  })  : _androidDataSource = androidDataSource,
        _iosDataSource = iosDataSource;

  final PermissionDataSource _androidDataSource;
  final PermissionDataSource _iosDataSource;

  @override
  Future<void> example() {
    switch (Platform().target) {
      case TargetPlatform.android:
        return _androidDataSource.example();
      case TargetPlatform.iOS:
        return _iosDataSource.example();
      default:
        throw PlatformNotSupportedException();
    }
  }
}
