import 'package:flutter_template/domain/datasources/network_datasource.dart';
import 'package:http/http.dart' as http;

class AndroidNetworkDataSource implements NetworkDataSource {
  @override
  Future<bool> hasInternet() async {
    final Uri uri = Uri(
      scheme: 'http',
      host: 'connectivitycheck.android.com',
      path: 'generate_204',
    );
    final http.Response response = await http.get(uri);
    return response.statusCode == 204;
  }
}
