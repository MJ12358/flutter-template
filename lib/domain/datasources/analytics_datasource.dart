abstract class AnalyticsDataSource {
  Future<void> logException({
    Object? details,
    StackTrace? stackTrace,
  });
}
