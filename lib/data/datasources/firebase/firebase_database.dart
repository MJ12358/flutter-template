import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_template/core/constants.dart';
import 'package:flutter_template/domain/core/database.dart';

class FirebaseDatabase implements Database {
  FirebaseAnalytics get _analytics => FirebaseAnalytics.instance;
  FirebaseCrashlytics get _crashlytics => FirebaseCrashlytics.instance;

  @override
  Future<void> init() async {
    // TODO: initialize FlutterFire via "flutterfire configure"
    // await Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );

    if (Build.isDebug) {
      await _analytics.setAnalyticsCollectionEnabled(false);
      await _crashlytics.setCrashlyticsCollectionEnabled(false);
    }
  }

  @override
  Object get db {
    throw UnimplementedError();
  }
}
