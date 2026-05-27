import 'package:flutter_template/bootstrap.dart';
import 'package:flutter_template/injector/injector.dart';
import 'package:get_it/get_it.dart';

/// Core Registration.
///
/// Used to bootstrap the application.
class CoreModule with InjectorMixin {
  void register(GetIt sl) {
    sl.registerLazySingleton<Bootstrap>(
      () => Bootstrap(
        logRepository: sl(),
      ),
    );
  }
}
