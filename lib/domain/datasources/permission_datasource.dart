abstract class PermissionDataSource {
  Future<void> requestCamera();
  Future<void> requestLocation();
  Future<void> requestStorage();
}
