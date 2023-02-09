import 'package:flutter_template/data/datasources/sembast/sembast_database.dart';
import 'package:flutter_template/data/datasources/sembast/sembast_settings_datasource.dart';
import 'package:flutter_template/data/repositories/settings_repository_impl.dart';
import 'package:flutter_template/domain/core/database.dart';
import 'package:flutter_template/domain/datasources/settings_datasource.dart';
import 'package:flutter_template/domain/repositories/settings_repository.dart';
import 'package:flutter_template/domain/usecases/settings/get_settings_usecase.dart';
import 'package:flutter_template/presentation/ui/app/app.dart';
import 'package:get_it/get_it.dart';

abstract class Injector {
  static final GetIt sl = GetIt.instance;
  static const String local = 'local';
  static const String remote = 'remote';
  static const String android = 'android';
  static const String ios = 'ios';

  static Future<void> init() async {
    /// Database Registration
    ///
    /// Used to initialized any databases

    sl.registerLazySingleton<Database>(
      () {
        return SembastDatabase();
      },
      instanceName: local,
    );

    /// Bloc Registration
    ///
    /// The `AppBloc` should be a singleton
    /// All other blocs should be factories

    sl.registerLazySingleton<AppBloc>(() {
      return AppBloc(
        getSettingsUseCase: sl(),
      );
    });

    /// Use Case Registration
    ///
    ///

    sl.registerLazySingleton<GetSettingsUseCase>(() {
      return GetSettingsUseCaseImpl(
        settingsRepository: sl(),
      );
    });

    /// Repository Registration
    ///
    /// Repositories are to handle datasources

    sl.registerLazySingleton<SettingsRepository>(() {
      return SettingsRepositoryImpl(
        localDataSource: sl(instanceName: local),
      );
    });

    /// Datasource Registration
    ///
    /// Datasources retrieve data

    sl.registerLazySingleton<SettingsDataSource>(
      () {
        return SembastSettingsDataSource(
          database: sl(instanceName: local),
        );
      },
      instanceName: local,
    );
  }
}
