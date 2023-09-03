import 'dart:io';

import 'package:dart_extensionz/dart_extensionz.dart';
import 'package:flutter_template/domain/datasources/network_datasource.dart';
import 'package:flutter_template/domain/exceptions/platform_not_supported_exception.dart';
import 'package:flutter_template/domain/repositories/network_repository.dart';

class NetworkRepositoryImpl implements NetworkRepository {
  const NetworkRepositoryImpl({
    required NetworkDataSource androidDataSource,
    required NetworkDataSource iosDataSource,
  })  : _androidDataSource = androidDataSource,
        _iosDataSource = iosDataSource;

  final NetworkDataSource _androidDataSource;
  final NetworkDataSource _iosDataSource;

  @override
  Future<bool> get isConnected {
    switch (Platform().target) {
      case TargetPlatform.android:
        return _isConnected(_androidDataSource);
      case TargetPlatform.iOS:
        return _isConnected(_iosDataSource);
      default:
        throw PlatformNotSupportedException();
    }
  }

  Future<bool> _isConnected(NetworkDataSource dataSource) async {
    try {
      if (await dataSource.hasConnectivity()) {
        return dataSource.hasInternet();
      }
      return false;
    } catch (_) {
      return false;
    }
  }
}
