import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dart_extensionz/dart_extensionz.dart';
import 'package:flutter_template/domain/datasources/network_datasource.dart';
import 'package:flutter_template/domain/exceptions/unimplemented_exception.dart';
import 'package:flutter_template/domain/repositories/network_repository.dart';

class NetworkRepositoryImpl implements NetworkRepository {
  const NetworkRepositoryImpl({
    required this._androidDataSource,
    required this._iosDataSource,
  });

  final NetworkDataSource _androidDataSource;
  final NetworkDataSource _iosDataSource;

  static const List<ConnectivityResult> _expectedResults = <ConnectivityResult>[
    ConnectivityResult.ethernet,
    ConnectivityResult.mobile,
    ConnectivityResult.vpn,
    ConnectivityResult.wifi,
  ];

  @override
  Future<bool> get isConnected {
    switch (PlatformExtension.target) {
      case TargetPlatform.android:
        return _isConnected(_androidDataSource);
      case TargetPlatform.iOS:
        return _isConnected(_iosDataSource);
      default:
        throw UnimplementedException.platform();
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
    final List<ConnectivityResult> results = await Connectivity()
        .checkConnectivity();
    if (_expectedResults.any(results.contains)) {
      return true;
    } else {
      return false;
    }
  }
}
