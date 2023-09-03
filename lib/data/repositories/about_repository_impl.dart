import 'dart:io';

import 'package:dart_extensionz/dart_extensionz.dart';
import 'package:flutter_template/domain/datasources/about_datasource.dart';
import 'package:flutter_template/domain/entities/about.dart';
import 'package:flutter_template/domain/exceptions/platform_not_supported_exception.dart';
import 'package:flutter_template/domain/repositories/about_repository.dart';

class AboutRepositoryImpl implements AboutRepository {
  const AboutRepositoryImpl({
    required AboutDataSource androidDataSource,
    required AboutDataSource iosDataSource,
  })  : _androidDataSource = androidDataSource,
        _iosDataSource = iosDataSource;

  final AboutDataSource _androidDataSource;
  final AboutDataSource _iosDataSource;

  @override
  Future<About> get() {
    switch (Platform().target) {
      case TargetPlatform.android:
        return _androidDataSource.get();
      case TargetPlatform.iOS:
        return _iosDataSource.get();
      default:
        throw PlatformNotSupportedException();
    }
  }
}
