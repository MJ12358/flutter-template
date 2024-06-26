import 'package:dart_extensionz/dart_extensionz.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_template/domain/exceptions/permission_exception.dart';
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
  Future<void> requestStorage() async {
    const Permission permission = Permission.storage;

    switch (PlatformExtension.target) {
      // android is special
      case TargetPlatform.android:
        final AndroidDeviceInfo info = await DeviceInfoPlugin().androidInfo;
        if (info.version.sdkInt < 33) {
          return _grant(permission);
        }
      default:
        return _grant(permission);
    }
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
