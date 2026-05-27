import 'dart:async';

import 'package:flutter_template/domain/datasources/analytics_datasource.dart';
import 'package:flutter_template/domain/entities/shared_prefs.dart';
import 'package:flutter_template/domain/repositories/analytics_repository.dart';
import 'package:flutter_template/domain/repositories/shared_prefs_repository.dart';

class AnalyticsRepositoryImpl implements AnalyticsRepository {
  AnalyticsRepositoryImpl({
    required this._remoteDataSource,
    required SharedPrefsRepository sharedPrefsRepository,
  }) {
    sharedPrefsRepository
        .get()
        .map((SharedPrefs event) => event.app.analyticsEnabled)
        .distinct()
        .listen((bool analyticsEnabled) {
          _analyticsEnabled = analyticsEnabled;
        });
  }

  final AnalyticsDataSource _remoteDataSource;
  bool _analyticsEnabled = true;

  @override
  void error({
    Object? message,
    StackTrace? trace,
  }) {
    if (!_analyticsEnabled) {
      return;
    }
    unawaited(
      _remoteDataSource.error(
        message: message,
        trace: trace,
      ),
    );
  }

  @override
  void fatal({
    Object? message,
    StackTrace? trace,
  }) {
    if (!_analyticsEnabled) {
      return;
    }
    unawaited(
      _remoteDataSource.fatal(
        message: message,
        trace: trace,
      ),
    );
  }

  @override
  void forceCrash() {
    _remoteDataSource.forceCrash();
  }
}
