import 'package:flutter_template/injector/modules/core_module.dart';
import 'package:flutter_template/injector/modules/database_module.dart';
import 'package:flutter_template/injector/modules/datasource_module.dart';
import 'package:flutter_template/injector/modules/presentation_module.dart';
import 'package:flutter_template/injector/modules/repository_module.dart';
import 'package:get_it/get_it.dart';

mixin InjectorMixin {
  String get local => 'local';
  String get remote => 'remote';
  String get android => 'android';
  String get ios => 'ios';
}

/// Inject interfaces with their implementations.
///
/// This orchestrates the dependency injection for the entire app.
/// It is responsible for initializing and registering all dependencies.
abstract final class Injector {
  static final GetIt sl = GetIt.instance;

  static Future<void> init() async {
    await CoreModule().register(sl);
    await DatabaseModule().register(sl);
    await DataSourceModule().register(sl);
    await RepositoryModule().register(sl);
    await PresentationModule().register(sl);
    // Wait for all async singletons to be ready
    // before allowing the app to start.
    await sl.allReady();
  }

  static Future<void> reset() async {
    await sl.reset();
  }
}
