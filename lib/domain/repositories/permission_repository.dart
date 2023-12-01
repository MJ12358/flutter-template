abstract class PermissionRepository {
  Future<void> requestCamera();
  Future<void> requestLocation();
  Future<void> requestStorage();
}
