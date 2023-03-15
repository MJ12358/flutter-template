import 'package:sembast/timestamp.dart';

extension SembastDateTimeExtension on DateTime? {
  Timestamp? toTimestamp() {
    if (this == null) {
      return null;
    }
    return Timestamp.fromDateTime(this!);
  }
}
