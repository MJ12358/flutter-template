import 'package:flutter_template/domain/datasources/analytics_datasource.dart';

class WebAnalyticsDataSource implements AnalyticsDataSource {
  @override
  Future<void> logException({
    Object? details,
    StackTrace? stackTrace,
  }) async {}
}
