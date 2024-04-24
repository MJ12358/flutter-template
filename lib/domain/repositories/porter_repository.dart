abstract class PorterRepository {
  Future<String> export();
  Future<void> import({
    required String data,
  });
}
