import 'package:flutter_template/domain/datasources/network_datasource.dart';
import 'package:http/http.dart' as http;

class IOSNetworkDataSource implements NetworkDataSource {
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
