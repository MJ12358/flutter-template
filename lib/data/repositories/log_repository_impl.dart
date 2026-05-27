import 'dart:async';

import 'package:flutter_template/domain/datasources/log_datasource.dart';
import 'package:flutter_template/domain/entities/log.dart';
import 'package:flutter_template/domain/entities/shared_prefs.dart';
import 'package:flutter_template/domain/repositories/analytics_repository.dart';
import 'package:flutter_template/domain/repositories/log_repository.dart';
import 'package:flutter_template/domain/repositories/shared_prefs_repository.dart';

class LogRepositoryImpl implements LogRepository {
  LogRepositoryImpl({
    required this._analyticsRepository,
    required this._localDataSource,
    required SharedPrefsRepository sharedPrefsRepository,
  }) {
    sharedPrefsRepository
        .get()
        .map((SharedPrefs event) => event.debug.logsEnabled)
        .distinct()
        .listen((bool logsEnabled) {
          _logsEnabled = logsEnabled;
        });
  }

  final AnalyticsRepository _analyticsRepository;
  final LogDataSource _localDataSource;
  bool _logsEnabled = true;

  @override
  Stream<List<Log>> get({
    DateTime? start,
  }) {
    return _localDataSource
        .get(start: start)
        .map((List<Log> event) => event..sort());
  }

  @override
  void info({
    required Object message,
  }) {
    _set(
      Log.info(
        message: message,
      ),
    );
  }

  @override
  void warning({
    required Object message,
  }) {
    _set(
      Log.warning(
        message: message,
      ),
    );
  }

  @override
  void error({
    required Object? message,
    required StackTrace? trace,
  }) {
    // Always log errors to analytics, regardless of the logsEnabled setting
    _analyticsRepository.error(
      message: message,
      trace: trace,
    );
    _set(
      Log.error(
        message: message,
        trace: trace,
      ),
    );
  }

  @override
  Future<void> clear({
    LogLevel? level,
  }) {
    return _localDataSource.clear(level: level);
  }

  void _set(Log log) {
    if (!_logsEnabled) {
      return;
    }
    unawaited(
      _localDataSource.set(log: log),
    );
  }
}
