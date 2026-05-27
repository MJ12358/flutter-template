import 'package:dart_extensionz/dart_extensionz.dart';
import 'package:flutter/services.dart' show PlatformException;
import 'package:flutter_template/domain/datasources/about_datasource.dart';
import 'package:flutter_template/domain/entities/about.dart';
import 'package:flutter_template/domain/exceptions/permission_exception.dart';
import 'package:flutter_template/domain/exceptions/unimplemented_exception.dart';
import 'package:flutter_template/domain/repositories/permission_repository.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionRepositoryImpl implements PermissionRepository {
  PermissionRepositoryImpl({
    required this._androidAboutDataSource,
  });

  final AboutDataSource _androidAboutDataSource;

  @override
  Future<void> requestCamera() async {
    return _grant(Permission.camera);
  }

  @override
  Future<void> requestLocation() {
    return _grant(Permission.locationWhenInUse);
  }

  @override
  Future<void> requestMicrophone() {
    return _grant(Permission.microphone);
  }

  @override
  Future<void> requestPhotos() {
    return _grant(Permission.photos);
  }

  @override
  Future<void> requestStorage() async {
    switch (PlatformExtension.target) {
      case TargetPlatform.android:
        return _requestAndroidStorage();
      case TargetPlatform.iOS:
        return _grant(Permission.storage);
      default:
        throw UnimplementedException.platform();
    }
  }

  Future<void> _grant(Permission permission) async {
    PermissionStatus status = PermissionStatus.granted;
    try {
      status = await permission.request();
    } on PlatformException catch (e) {
      // skip an exception when multiple permission requests are called
      if (e.message != null &&
          !e.message!.contains('A request for permission is already running')) {
        rethrow;
      }
    } catch (e) {
      rethrow;
    }
    // restricted and provisional are iOS specific
    switch (status) {
      case PermissionStatus.granted:
        return;
      case PermissionStatus.denied:
      case PermissionStatus.permanentlyDenied:
      case PermissionStatus.restricted:
      case PermissionStatus.limited:
      case PermissionStatus.provisional:
        await _openAppSettings(permission);
    }
  }

  Future<void> _openAppSettings(Permission permission) async {
    final bool opened = await openAppSettings();
    if (!opened) {
      throw PermissionException.deniedPermanently(permission.toString());
    }
  }

  Future<void> _requestAndroidStorage() async {
    final About info = await _androidAboutDataSource.get();
    // READ/WRITE_EXTERNAL_STORAGE has been removed since API 33
    if (info.sdkVersion < 33) {
      return _grant(Permission.storage);
    }
  }
}
