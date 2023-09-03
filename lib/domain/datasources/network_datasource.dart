abstract class NetworkDataSource {
  Future<bool> hasConnectivity();
  Future<bool> hasInternet();
}
