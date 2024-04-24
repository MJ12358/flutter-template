import 'package:flutter_template/domain/datasources/network_datasource.dart';
import 'package:http/http.dart' as http;

class WindowsNetworkDataSource implements NetworkDataSource {
  @override
  Future<bool> hasInternet() async {
    final Uri uri = Uri(
      scheme: 'http',
      host: 'www.msftncsi.com',
      path: 'ncsi.txt',
    );
    final http.Response response = await http.get(uri);
    return response.statusCode == 200;
  }
}
