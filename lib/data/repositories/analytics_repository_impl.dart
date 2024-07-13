import 'dart:async';
import 'dart:developer';

import 'package:flutter_template/core/constants.dart';
import 'package:flutter_template/domain/datasources/analytics_datasource.dart';
import 'package:flutter_template/domain/entities/settings.dart';
import 'package:flutter_template/domain/repositories/analytics_repository.dart';
import 'package:flutter_template/domain/repositories/settings_repository.dart';

class AnalyticsRepositoryImpl implements AnalyticsRepository {
  AnalyticsRepositoryImpl({
    required AnalyticsDataSource remoteDataSource,
    required AnalyticsDataSource webDataSource,
    required SettingsRepository settingsRepository,
  })  : _remoteDataSource = remoteDataSource,
        _webDataSource = webDataSource {
    settingsRepository.get().listen((Settings event) {
      _settings = event;
    });
  }

  final AnalyticsDataSource _remoteDataSource;
  final AnalyticsDataSource _webDataSource;

  late Settings _settings;

  @override
  void logException({
    Object? details,
    StackTrace? stackTrace,
  }) {
    if (!_settings.analytics) {
      return;
    }
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
