import 'package:flutter_template/domain/datasources/network_datasource.dart';
import 'package:http/http.dart' as http;

class LinuxNetworkDataSource implements NetworkDataSource {
  @override
  Future<bool> hasInternet() async {
    final Uri uri = Uri(
      scheme: 'http',
      host: 'connectivity-check.ubuntu.com',
    );
    final http.Response response = await http.get(uri);
    return response.statusCode == 204;
  }
}
