import 'package:flutter_template/bootstrap.dart';
import 'package:flutter_template/data/datasources/android/android_about_datasource.dart';
import 'package:flutter_template/data/datasources/android/android_network_datasource.dart';
import 'package:flutter_template/data/datasources/android/android_permission_datasource.dart';
import 'package:flutter_template/data/datasources/firebase/firebase_analytics_datasource.dart';
import 'package:flutter_template/data/datasources/firebase/firebase_database.dart';
import 'package:flutter_template/data/datasources/ios/ios_about_datasource.dart';
import 'package:flutter_template/data/datasources/ios/ios_network_datasource.dart';
import 'package:flutter_template/data/datasources/ios/ios_permission_datasource.dart';
import 'package:flutter_template/data/datasources/sembast/sembast_database.dart';
import 'package:flutter_template/data/datasources/sembast/sembast_settings_datasource.dart';
import 'package:flutter_template/data/repositories/about_repository_impl.dart';
import 'package:flutter_template/data/repositories/analytics_repository_impl.dart';
import 'package:flutter_template/data/repositories/network_repository_impl.dart';
import 'package:flutter_template/data/repositories/permission_repository_impl.dart';
import 'package:flutter_template/data/repositories/settings_repository_impl.dart';
import 'package:flutter_template/domain/core/database.dart';
import 'package:flutter_template/domain/datasources/about_datasource.dart';
import 'package:flutter_template/domain/datasources/analytics_datasource.dart';
import 'package:flutter_template/domain/datasources/network_datasource.dart';
import 'package:flutter_template/domain/datasources/permission_datasource.dart';
import 'package:flutter_template/domain/datasources/settings_datasource.dart';
import 'package:flutter_template/domain/repositories/about_repository.dart';
import 'package:flutter_template/domain/repositories/analytics_repository.dart';
import 'package:flutter_template/domain/repositories/network_repository.dart';
import 'package:flutter_template/domain/repositories/permission_repository.dart';
import 'package:flutter_template/domain/repositories/settings_repository.dart';
import 'package:flutter_template/domain/usecases/settings/get_settings_usecase.dart';
import 'package:flutter_template/domain/usecases/settings/set_settings_usecase.dart';
import 'package:flutter_template/presentation/ui/app/app.dart';
import 'package:get_it/get_it.dart';

class Injector {
  Injector._();
  static final GetIt sl = GetIt.instance;
  static const String local = 'local';
  static const String remote = 'remote';
  static const String android = 'android';
  static const String ios = 'ios';

  static Future<void> init() async {
    /// Bootstrap Registration.
    ///
    /// Used to bootstrap the application.

    sl.registerLazySingleton<Bootstrap>(() {
      return Bootstrap(
        analyticsRepository: sl(),
      );
    });

    /// Database Registration
    ///
    /// Used to initialized any databases.

    sl.registerLazySingleton<Database>(
      () {
        return SembastDatabase();
      },
      instanceName: local,
    );

    sl.registerLazySingleton<Database>(
      () {
        return FirebaseDatabase();
      },
      instanceName: remote,
    );

    /// Bloc Registration
    ///
    /// The `AppBloc` should be a singleton.
    /// All other blocs should be factories.

    sl.registerLazySingleton<AppBloc>(() {
      return AppBloc(
        getSettingsUseCase: sl(),
        setSettingsUseCase: sl(),
      );
    });

    /// Use Case Registration
    ///
    ///

    sl.registerLazySingleton<GetSettingsUseCase>(() {
      return GetSettingsUseCaseImpl(
        analyticsRepository: sl(),
        settingsRepository: sl(),
      );
    });

    sl.registerLazySingleton<SetSettingsUseCase>(() {
      return SetSettingsUseCaseImpl(
        analyticsRepository: sl(),
        settingsRepository: sl(),
      );
    });

    /// Repository Registration
    ///
    /// Repositories are to handle datasources.

    sl.registerLazySingleton<AboutRepository>(() {
      return AboutRepositoryImpl(
        androidDataSource: sl(instanceName: android),
        iosDataSource: sl(instanceName: ios),
      );
    });

    sl.registerLazySingleton<AnalyticsRepository>(() {
      return AnalyticsRepositoryImpl(
        remoteDataSource: sl(instanceName: remote),
      );
    });

    sl.registerLazySingleton<NetworkRepository>(() {
      return NetworkRepositoryImpl(
        androidDataSource: sl(instanceName: android),
        iosDataSource: sl(instanceName: ios),
      );
    });

    sl.registerLazySingleton<PermissionRepository>(() {
      return PermissionRepositoryImpl(
        androidDataSource: sl(instanceName: android),
        iosDataSource: sl(instanceName: ios),
      );
    });

    sl.registerLazySingleton<SettingsRepository>(() {
      return SettingsRepositoryImpl(
        localDataSource: sl(instanceName: local),
      );
    });

    /// Datasource Registration
    ///
    /// Datasources retrieve data.

    // local

    sl.registerLazySingleton<SettingsDataSource>(
      () {
        return SembastSettingsDataSource(
          database: sl(instanceName: local),
        );
      },
      instanceName: local,
    );

    // remote

    sl.registerLazySingleton<AnalyticsDataSource>(
      () {
        return FirebaseAnalyticsDataSource();
      },
      instanceName: remote,
    );

    // android

    sl.registerLazySingleton<AboutDataSource>(
      () {
        return AndroidAboutDataSource();
      },
      instanceName: android,
    );

    sl.registerLazySingleton<NetworkDataSource>(
      () {
        return AndroidNetworkDataSource();
      },
      instanceName: android,
    );

    sl.registerLazySingleton<PermissionDataSource>(
      () {
        return AndroidPermissionDataSource();
      },
      instanceName: android,
    );

    // ios

    sl.registerLazySingleton<AboutDataSource>(
      () {
        return IOSAboutDataSource();
      },
      instanceName: ios,
    );

    sl.registerLazySingleton<IOSNetworkDataSource>(
      () {
        return IOSNetworkDataSource();
      },
      instanceName: ios,
    );

    sl.registerLazySingleton<PermissionDataSource>(
      () {
        return IOSPermissionDataSource();
      },
      instanceName: ios,
    );
  }
}
