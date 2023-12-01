import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_template/domain/datasources/network_datasource.dart';
import 'package:http/http.dart' as http;

class IOSNetworkDataSource implements NetworkDataSource {
  @override
  Future<bool> hasConnectivity() async {
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

  @override
  Future<bool> hasInternet() async {
    final Uri uri = Uri(
      scheme: 'https',
      host: 'apple.com',
      path: 'library/test/success.html',
    );
    final http.Response response = await http.get(uri);
    return response.statusCode == 200;
  }
}
