import 'package:flutter_template/domain/entities/shared_prefs.dart';

abstract interface class SharedPrefsRepository {
  Stream<SharedPrefs> get();
  Future<void> set(SharedPrefs value);
}
