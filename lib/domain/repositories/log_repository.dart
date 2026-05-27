import 'package:flutter_template/domain/entities/log.dart';

abstract interface class LogRepository {
  Stream<List<Log>> get({
    DateTime? start,
  });
  void info({
    required Object message,
  });
  void warning({
    required Object message,
  });
  void error({
    required Object? message,
    required StackTrace? trace,
  });
  Future<void> clear({
    LogLevel? level,
  });
}
