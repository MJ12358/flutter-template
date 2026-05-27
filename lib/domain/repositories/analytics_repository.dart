abstract interface class AnalyticsRepository {
  void error({
    Object? message,
    StackTrace? trace,
  });
  void fatal({
    Object? message,
    StackTrace? trace,
  });
  void forceCrash();
}
