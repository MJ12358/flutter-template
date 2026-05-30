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
    await _initCore();
    await _initDatabase();
    await _initDataSources();
    await _initRepositories();
    await _initPresentation();
    // Wait for all async singletons to be ready
    // before allowing the app to start.
    await sl.allReady();
  }

  static Future<void> _initCore() {
    return CoreModule().register(sl);
  }

  static Future<void> _initDatabase() {
    return DatabaseModule().register(sl);
  }

  static Future<void> _initDataSources() {
    return DataSourceModule().register(sl);
  }

  static Future<void> _initRepositories() {
    return RepositoryModule().register(sl);
  }

  static Future<void> _initPresentation() {
    return PresentationModule().register(sl);
  }

  static Future<void> reset() async {
    await sl.reset();
  }
}
