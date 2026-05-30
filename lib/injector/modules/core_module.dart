import 'package:flutter_template/bootstrap.dart';
import 'package:flutter_template/injector/injector.dart';
import 'package:get_it/get_it.dart';

/// Core Registration.
///
/// Used to bootstrap the application.
class CoreModule with InjectorMixin {
  Future<void> register(GetIt sl) async {
    sl.registerLazySingleton<Bootstrap>(
      () => Bootstrap(
        logRepository: sl(),
      ),
    );
  }
}
