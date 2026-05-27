import 'package:dart_extensionz/dart_extensionz.dart';
import 'package:flutter_template/data/extensions/sembast/sembast_extension.dart';
import 'package:flutter_template/domain/entities/log.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/timestamp.dart';

class SembastLogModel extends Log {
  SembastLogModel({
    int? id,
    String? level,
    super.message,
    Timestamp? timestamp,
    super.trace,
  }) : super(
         id: id?.toString(),
         level: level?.toEnum(LogLevel.values),
         timestamp: timestamp?.toDateTime(),
       );

  static const String keyId = 'id';
  static const String keyLevel = 'level';
  static const String keyMessage = 'message';
  static const String keyTimestamp = 'timestamp';
  static const String keyTrace = 'trace';

  factory SembastLogModel.fromEntity(Log log) {
    return SembastLogModel(
      id: int.tryParse(log.id),
      level: log.level.name,
      message: log.message,
      timestamp: log.timestamp.toTimestamp(),
      trace: log.trace,
    );
  }

  factory SembastLogModel.fromMap(Map<String, Object?>? map) {
    return SembastLogModel(
      id: map.get<int>(keyId),
      level: map.get<String>(keyLevel),
      message: map.get<String>(keyMessage),
      timestamp: map.get<Timestamp>(keyTimestamp),
      trace: map.get<String>(keyTrace),
    );
  }

  factory SembastLogModel.fromRecord(
    RecordSnapshot<int, Map<String, Object?>>? record,
  ) {
    Map<String, Object?> map = <String, Object?>{};
    if (record != null) {
      map = Map<String, Object?>.of(record.value);
    }
    map[keyId] = record?.key;
    return SembastLogModel.fromMap(map);
  }

  static List<SembastLogModel> fromQuery(
    List<RecordSnapshot<int, Map<String, Object?>>> query,
  ) {
    return query.map((RecordSnapshot<int, Map<String, Object?>> record) {
      return SembastLogModel.fromRecord(record);
    }).toList();
  }

  @override
  Map<String, Object?> toMap() {
    return <String, Object?>{
      keyId: id,
      keyLevel: level.name,
      keyMessage: message,
      keyTimestamp: timestamp.toTimestamp(),
      keyTrace: trace,
    };
  }
}
