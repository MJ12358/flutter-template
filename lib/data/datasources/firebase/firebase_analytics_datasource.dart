import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_template/domain/datasources/analytics_datasource.dart';

/// Firebase does not log when in debug mode.
/// Even when setAnalyticsCollectionEnabled = true. (See FirebaseDatabase class)
///
/// https://stackoverflow.com/questions/42769236/firebase-analytics-debug-view-does-not-show-anything.
///
/// To do this you must run this command in adb:
///
/// adb shell setprop debug.firebase.analytics.app com.hairbraindev.tracktrends
///
/// adb shell setprop log.tag.FA-SVC VERBOSE
///
/// There are constraints on parameter lengths for Analytics.
///
/// key: 40
///
/// value: 100
class FirebaseAnalyticsDataSource implements AnalyticsDataSource {
  static final FirebaseCrashlytics _crashlytics = FirebaseCrashlytics.instance;

  @override
  Future<void> error({
    Object? message,
    StackTrace? trace,
  }) {
    return _crashlytics.recordError(
      message,
      trace,
    );
  }

  @override
  Future<void> fatal({
    Object? message,
    StackTrace? trace,
  }) {
    return _crashlytics.recordError(
      message,
      trace,
      fatal: true,
    );
  }

  @override
  void forceCrash() {
    _crashlytics.crash();
  }
}
