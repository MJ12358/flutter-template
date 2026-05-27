abstract interface class AnalyticsDataSource {
  Future<void> error({
    Object? message,
    StackTrace? trace,
  });
  Future<void> fatal({
    Object? message,
    StackTrace? trace,
  });
  void forceCrash();
}
