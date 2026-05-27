import 'package:flutter_template/domain/entities/log.dart';

abstract interface class LogDataSource {
  Stream<List<Log>> get({
    DateTime? start,
  });
  Future<void> set({
    required Log log,
  });
  Future<void> clear({
    LogLevel? level,
  });
}
