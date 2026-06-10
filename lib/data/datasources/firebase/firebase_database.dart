import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_template/core/constants.dart';
import 'package:flutter_template/domain/core/remote_database.dart';

class FirebaseDatabase implements RemoteDatabase<Object> {
  static FirebaseCrashlytics get _crashlytics => FirebaseCrashlytics.instance;

  @override
  Future<FirebaseDatabase> init() async {
    // await Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );

    if (Build.isDebug) {
      await _crashlytics.setCrashlyticsCollectionEnabled(false);
    }

    return this;
  }

  @override
  Object get db {
    throw UnimplementedError();
  }

  @override
  Future<void> close() async {}
}
