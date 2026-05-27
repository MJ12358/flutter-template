import 'package:dart_extensionz/dart_extensionz.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'log.g.dart';

@MappableEnum()
enum LogLevel {
  info,
  warning,
  error,
}

@MappableClass()
class Log with LogMappable implements Comparable<Log> {
  Log({
    String? id,
    Object? message,
    LogLevel? level,
    DateTime? timestamp,
    String? trace,
  })  : id = id ?? '',
        message = message?.toString() ?? 'Unknown Error',
        level = level ?? LogLevel.info,
        timestamp = timestamp ?? DateTime.now(),
        trace = trace ?? '';

  final String id;
  final LogLevel level;
  final String message;
  final DateTime timestamp;
  final String trace;

  Log.info({
    Object? message,
  }) : this(
          level: LogLevel.info,
          message: message,
        );

  Log.warning({
    Object? message,
  }) : this(
          level: LogLevel.warning,
          message: message,
        );

  Log.error({
    Object? message,
    StackTrace? trace,
  }) : this(
          level: LogLevel.error,
          message: message,
          trace: trace?.toString() ?? StackTrace.current.toString(),
        );

  String get formattedTimestamp {
    // Always use hours:minutes:seconds format
    // due to the grouping on the front end
    return timestamp.format(pattern: 'h:mm:ss a');
  }

  @override
  String toString() {
    return '[$timestamp] [$level]\n'
        '$message\n'
        '$trace';
  }

  @override
  int compareTo(Log other) {
    // Compare by timestamp in descending order
    return other.timestamp.compareTo(timestamp);
  }
}
