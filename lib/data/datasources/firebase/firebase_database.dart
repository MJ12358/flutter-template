import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_template/core/constants.dart';
import 'package:flutter_template/domain/core/database.dart';

class FirebaseDatabase implements Database {
  FirebaseCrashlytics get _crashlytics => FirebaseCrashlytics.instance;

  @override
  Future<void> init() async {
    // TODO: initialize Firebase via "flutterfire configure"
    // await Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );

    if (!Build.isWeb && Build.isDebug) {
      // await _crashlytics.setCrashlyticsCollectionEnabled(false);
    }
  }

  @override
  Object get db {
    throw UnimplementedError();
  }

  @override
  Future<String> export() {
    throw UnimplementedError();
  }

  @override
  Future<void> import({
    required String data,
  }) {
    throw UnimplementedError();
  }
}
