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

  static Future<void> _initCore() async {
    CoreModule().register(sl);
  }

  static Future<void> _initDatabase() async {
    await DatabaseModule().register(sl);
  }

  static Future<void> _initDataSources() async {
    DataSourceModule().register(sl);
  }

  static Future<void> _initRepositories() async {
    RepositoryModule().register(sl);
  }

  static Future<void> _initPresentation() async {
    PresentationModule().register(sl);
  }

  static Future<void> reset() async {
    await sl.reset();
  }
}
