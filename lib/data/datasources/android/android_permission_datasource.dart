import 'package:flutter_template/domain/datasources/permission_datasource.dart';
import 'package:flutter_template/domain/exceptions/permission_denied_exception.dart';
import 'package:permission_handler/permission_handler.dart';

class AndroidPermissionDataSource implements PermissionDataSource {
  @override
  Future<void> requestCamera() async {
    if (await Permission.camera.isGranted) {
      return;
    }

    final PermissionStatus status = await Permission.camera.request();

    if (status.isDenied) {
      throw PermissionDeniedException();
    }
  }

  @override
  Future<void> requestLocation() async {
    if (await Permission.locationWhenInUse.isGranted) {
      return;
    }

    final PermissionStatus status =
        await Permission.locationWhenInUse.request();

    if (status.isDenied) {
      throw PermissionDeniedException();
    }
  }

  @override
  Future<void> requestStorage() async {
    if (await Permission.storage.isGranted) {
      return;
    }

    final PermissionStatus status = await Permission.storage.request();

    if (status.isDenied) {
      throw PermissionDeniedException();
    }
  }
}
