abstract class AnalyticsDataSource {
  Future<void> logAppOpen();
  Future<void> logException({
    Object? details,
    StackTrace? stackTrace,
  });
  Future<void> logLogin({
    String? provider,
  });
  Future<void> logLogout();
}
