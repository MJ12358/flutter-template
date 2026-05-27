import 'package:flutter_template/data/datasources/sembast/sembast_database.dart';
import 'package:get_it/get_it.dart';

/// Database Registration.
///
/// Used to initialize any databases.
class DatabaseModule {
  Future<void> register(GetIt sl) async {
    sl.registerSingletonAsync<SembastDatabase>(
      () => SembastDatabase().init(),
    );
  }
}
