// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'log.dart';

class LogLevelMapper extends EnumMapper<LogLevel> {
  LogLevelMapper._();

  static LogLevelMapper? _instance;
  static LogLevelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LogLevelMapper._());
    }
    return _instance!;
  }

  static LogLevel fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  LogLevel decode(dynamic value) {
    switch (value) {
      case r'info':
        return LogLevel.info;
      case r'warning':
        return LogLevel.warning;
      case r'error':
        return LogLevel.error;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(LogLevel self) {
    switch (self) {
      case LogLevel.info:
        return r'info';
      case LogLevel.warning:
        return r'warning';
      case LogLevel.error:
        return r'error';
    }
  }
}

extension LogLevelMapperExtension on LogLevel {
  String toValue() {
    LogLevelMapper.ensureInitialized();
    return MapperContainer.globals.toValue<LogLevel>(this) as String;
  }
}

class LogMapper extends ClassMapperBase<Log> {
  LogMapper._();

  static LogMapper? _instance;
  static LogMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LogMapper._());
      LogLevelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Log';

  static String _$id(Log v) => v.id;
  static const Field<Log, String> _f$id = Field('id', _$id, opt: true);
  static String _$message(Log v) => v.message;
  static dynamic _arg$message(f) => f<String>();
  static const Field<Log, Object> _f$message = Field(
    'message',
    _$message,
    opt: true,
    arg: _arg$message,
  );
  static LogLevel _$level(Log v) => v.level;
  static const Field<Log, LogLevel> _f$level = Field(
    'level',
    _$level,
    opt: true,
  );
  static DateTime _$timestamp(Log v) => v.timestamp;
  static const Field<Log, DateTime> _f$timestamp = Field(
    'timestamp',
    _$timestamp,
    opt: true,
  );
  static String _$trace(Log v) => v.trace;
  static const Field<Log, String> _f$trace = Field('trace', _$trace, opt: true);

  @override
  final MappableFields<Log> fields = const {
    #id: _f$id,
    #message: _f$message,
    #level: _f$level,
    #timestamp: _f$timestamp,
    #trace: _f$trace,
  };

  static Log _instantiate(DecodingData data) {
    return Log(
      id: data.dec(_f$id),
      message: data.dec(_f$message),
      level: data.dec(_f$level),
      timestamp: data.dec(_f$timestamp),
      trace: data.dec(_f$trace),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Log fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Log>(map);
  }

  static Log fromJson(String json) {
    return ensureInitialized().decodeJson<Log>(json);
  }
}

mixin LogMappable {
  String toJson() {
    return LogMapper.ensureInitialized().encodeJson<Log>(this as Log);
  }

  Map<String, dynamic> toMap() {
    return LogMapper.ensureInitialized().encodeMap<Log>(this as Log);
  }

  LogCopyWith<Log, Log, Log> get copyWith =>
      _LogCopyWithImpl<Log, Log>(this as Log, $identity, $identity);
  @override
  bool operator ==(Object other) {
    return LogMapper.ensureInitialized().equalsValue(this as Log, other);
  }

  @override
  int get hashCode {
    return LogMapper.ensureInitialized().hashValue(this as Log);
  }
}

extension LogValueCopy<$R, $Out> on ObjectCopyWith<$R, Log, $Out> {
  LogCopyWith<$R, Log, $Out> get $asLog =>
      $base.as((v, t, t2) => _LogCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class LogCopyWith<$R, $In extends Log, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? id,
    Object? message,
    LogLevel? level,
    DateTime? timestamp,
    String? trace,
  });
  LogCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _LogCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Log, $Out>
    implements LogCopyWith<$R, Log, $Out> {
  _LogCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Log> $mapper = LogMapper.ensureInitialized();
  @override
  $R call({
    Object? id = $none,
    Object? message = $none,
    Object? level = $none,
    Object? timestamp = $none,
    Object? trace = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != $none) #id: id,
      if (message != $none) #message: message,
      if (level != $none) #level: level,
      if (timestamp != $none) #timestamp: timestamp,
      if (trace != $none) #trace: trace,
    }),
  );
  @override
  Log $make(CopyWithData data) => Log(
    id: data.get(#id, or: $value.id),
    message: data.get(#message, or: $value.message),
    level: data.get(#level, or: $value.level),
    timestamp: data.get(#timestamp, or: $value.timestamp),
    trace: data.get(#trace, or: $value.trace),
  );

  @override
  LogCopyWith<$R2, Log, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _LogCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

