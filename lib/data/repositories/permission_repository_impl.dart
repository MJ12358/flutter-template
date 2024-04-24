import 'package:flutter_template/domain/exceptions/permission_denied_exception.dart';
import 'package:flutter_template/domain/repositories/permission_repository.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionRepositoryImpl implements PermissionRepository {
  const PermissionRepositoryImpl();

  @override
  Future<void> requestCamera() {
    const Permission permission = Permission.camera;
    return _grant(permission);
  }

  @override
  Future<void> requestLocation() {
    const Permission permission = Permission.locationWhenInUse;
    return _grant(permission);
  }

  @override
  Future<void> requestStorage() {
    const Permission permission = Permission.storage;
    return _grant(permission);
  }

  Future<void> _grant(Permission permission) async {
    if (await permission.isGranted) {
      return;
    }
    final PermissionStatus status = await permission.request();
    if (status.isPermanentlyDenied) {
      throw PermissionException.deniedPermanently(permission.toString());
    }
    if (status.isDenied) {
      throw PermissionException.denied(permission.toString());
    }
  }
}
