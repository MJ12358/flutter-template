import 'dart:async';

import 'package:flutter_template/domain/entities/shared_prefs.dart';
import 'package:flutter_template/domain/repositories/shared_prefs_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsRepositoryImpl implements SharedPrefsRepository {
  const SharedPrefsRepositoryImpl();

  Future<SharedPreferences> get _prefs => SharedPreferences.getInstance();

  static final StreamController<SharedPrefs> _controller =
      StreamController<SharedPrefs>.broadcast();

  static const String _key = 'flutter_template';

  @override
  Stream<SharedPrefs> get() async* {
    unawaited(
      _prefs.then((SharedPreferences prefs) {
        final String? value = prefs.getString(_key);
        final SharedPrefs output = value != null
            ? SharedPrefs.fromJson(value)
            : const SharedPrefs();
        _controller.add(output);
      }),
    );
    yield* _controller.stream;
  }

  @override
  Future<void> set(SharedPrefs value) async {
    final SharedPreferences prefs = await _prefs;
    final String json = value.toJson();
    await prefs.setString(_key, json);
    _controller.add(value);
  }
}
