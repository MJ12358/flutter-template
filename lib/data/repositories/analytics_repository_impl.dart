import 'dart:async';
import 'dart:developer';

import 'package:flutter_template/domain/datasources/analytics_datasource.dart';
import 'package:flutter_template/domain/repositories/analytics_repository.dart';

class AnalyticsRepositoryImpl implements AnalyticsRepository {
  const AnalyticsRepositoryImpl({
    required AnalyticsDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  final AnalyticsDataSource _remoteDataSource;

  @override
  void logException({
    Object? details,
    StackTrace? stackTrace,
  }) {
    try {
      unawaited(
        _remoteDataSource.logException(
          details: details,
          stackTrace: stackTrace,
        ),
      );
    } catch (e, s) {
      log('$e', stackTrace: s);
    }
  }
}
