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
  Future<void> requestCamera() {
    switch (PlatformExtension.target) {
      case TargetPlatform.android:
        return _androidDataSource.requestCamera();
      case TargetPlatform.iOS:
        return _iosDataSource.requestCamera();
      default:
        throw PlatformNotSupportedException();
    }
  }

  @override
  Future<void> requestLocation() {
    switch (PlatformExtension.target) {
      case TargetPlatform.android:
        return _androidDataSource.requestLocation();
      case TargetPlatform.iOS:
        return _iosDataSource.requestLocation();
      default:
        throw PlatformNotSupportedException();
    }
  }

  @override
  Future<void> requestStorage() {
    switch (PlatformExtension.target) {
      case TargetPlatform.android:
        return _androidDataSource.requestStorage();
      case TargetPlatform.iOS:
        return _iosDataSource.requestStorage();
      default:
        throw PlatformNotSupportedException();
    }
  }
}
