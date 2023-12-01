abstract class AnalyticsRepository {
  void logException({
    Object? details,
    StackTrace? stackTrace,
  });
}
