import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dart_extensionz/dart_extensionz.dart';
import 'package:flutter_template/domain/datasources/network_datasource.dart';
import 'package:flutter_template/domain/exceptions/platform_exception.dart';
import 'package:flutter_template/domain/repositories/network_repository.dart';

class NetworkRepositoryImpl implements NetworkRepository {
  const NetworkRepositoryImpl({
    required NetworkDataSource androidDataSource,
    required NetworkDataSource iosDataSource,
    required NetworkDataSource linuxDataSource,
    required NetworkDataSource windowsDataSource,
  })  : _androidDataSource = androidDataSource,
        _iosDataSource = iosDataSource,
        _linuxDataSource = linuxDataSource,
        _windowsDataSource = windowsDataSource;

  final NetworkDataSource _androidDataSource;
  final NetworkDataSource _iosDataSource;
  final NetworkDataSource _linuxDataSource;
  final NetworkDataSource _windowsDataSource;

  @override
  Future<bool> get isConnected {
    switch (PlatformExtension.target) {
      case TargetPlatform.android:
        return _isConnected(_androidDataSource);
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return _isConnected(_iosDataSource);
      case TargetPlatform.linux:
        return _isConnected(_linuxDataSource);
      case TargetPlatform.windows:
        return _isConnected(_windowsDataSource);
      default:
        throw PlatformException.notSupported();
    }
  }

  Future<bool> _isConnected(NetworkDataSource dataSource) async {
    try {
      if (await _hasConnectivity()) {
        return dataSource.hasInternet();
      } else {
        return false;
      }
    } catch (_) {
      return false;
    }
  }

  Future<bool> _hasConnectivity() async {
    final ConnectivityResult result = await Connectivity().checkConnectivity();
    switch (result) {
      case ConnectivityResult.ethernet:
      case ConnectivityResult.mobile:
      case ConnectivityResult.vpn:
      case ConnectivityResult.wifi:
        return true;
      case ConnectivityResult.bluetooth:
      case ConnectivityResult.other:
      case ConnectivityResult.none:
        return false;
    }
  }
}
