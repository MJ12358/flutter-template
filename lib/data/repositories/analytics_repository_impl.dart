import 'dart:async';
import 'dart:developer';

import 'package:flutter_template/core/constants.dart';
import 'package:flutter_template/domain/datasources/analytics_datasource.dart';
import 'package:flutter_template/domain/repositories/analytics_repository.dart';

class AnalyticsRepositoryImpl implements AnalyticsRepository {
  const AnalyticsRepositoryImpl({
    required AnalyticsDataSource remoteDataSource,
    required AnalyticsDataSource webDataSource,
  })  : _remoteDataSource = remoteDataSource,
        _webDataSource = webDataSource;

  final AnalyticsDataSource _remoteDataSource;
  final AnalyticsDataSource _webDataSource;

  @override
  void logException({
    Object? details,
    StackTrace? stackTrace,
  }) {
    try {
      if (Build.isWeb) {
        unawaited(
          _webDataSource.logException(
            details: details,
            stackTrace: stackTrace,
          ),
        );
      } else {
        unawaited(
          _remoteDataSource.logException(
            details: details,
            stackTrace: stackTrace,
          ),
        );
      }
    } catch (e, s) {
      log('$e', stackTrace: s);
    }
  }
}
