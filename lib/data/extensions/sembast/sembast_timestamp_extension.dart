import 'package:sembast/timestamp.dart';

extension SembastTimestampExtension on Timestamp {
  static Timestamp? fromDate(DateTime? date) {
    if (date == null) {
      return null;
    }
    return Timestamp.fromDateTime(date);
  }
}
