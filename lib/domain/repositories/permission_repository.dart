abstract interface class PermissionRepository {
  Future<void> requestCamera();
  Future<void> requestLocation();
  Future<void> requestMicrophone();
  Future<void> requestPhotos();
  Future<void> requestStorage();
}
