import 'package:flutter_template/data/datasources/firebase/firebase_database.dart';
import 'package:flutter_template/data/datasources/sembast/sembast_database.dart';
import 'package:flutter_template/injector/injector.dart';
import 'package:get_it/get_it.dart';

/// Database Registration.
///
/// Used to initialize any databases.
class DatabaseModule with InjectorMixin {
  Future<void> register(GetIt sl) async {
    sl.registerSingletonAsync<SembastDatabase>(
      () => SembastDatabase().init(),
      instanceName: local,
    );

    sl.registerSingletonAsync<FirebaseDatabase>(
      () => FirebaseDatabase().init(),
      instanceName: remote,
    );
  }
}
