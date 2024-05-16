import 'package:dart_extensionz/dart_extensionz.dart';
import 'package:flutter_template/core/constants.dart';
import 'package:flutter_template/domain/datasources/about_datasource.dart';
import 'package:flutter_template/domain/entities/about.dart';
import 'package:flutter_template/domain/exceptions/platform_exception.dart';
import 'package:flutter_template/domain/repositories/about_repository.dart';

class AboutRepositoryImpl implements AboutRepository {
  const AboutRepositoryImpl({
    required AboutDataSource androidDataSource,
    required AboutDataSource iosDataSource,
    required AboutDataSource linuxDataSource,
    required AboutDataSource windowsDataSource,
    required AboutDataSource webDataSource,
  })  : _androidDataSource = androidDataSource,
        _iosDataSource = iosDataSource,
        _linuxDataSource = linuxDataSource,
        _windowsDataSource = windowsDataSource,
        _webDataSource = webDataSource;

  final AboutDataSource _androidDataSource;
  final AboutDataSource _iosDataSource;
  final AboutDataSource _linuxDataSource;
  final AboutDataSource _windowsDataSource;
  final AboutDataSource _webDataSource;

  @override
  Future<About> get() {
    if (Build.isWeb) {
      return _webDataSource.get();
    }

    switch (PlatformExtension.target) {
      case TargetPlatform.android:
        return _androidDataSource.get();
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return _iosDataSource.get();
      case TargetPlatform.linux:
        return _linuxDataSource.get();
      case TargetPlatform.windows:
        return _windowsDataSource.get();
      default:
        throw PlatformException.notSupported();
    }
  }
}
