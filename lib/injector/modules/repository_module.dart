import 'package:flutter_template/data/repositories/about_repository_impl.dart';
import 'package:flutter_template/data/repositories/analytics_repository_impl.dart';
import 'package:flutter_template/data/repositories/log_repository_impl.dart';
import 'package:flutter_template/data/repositories/network_repository_impl.dart';
import 'package:flutter_template/data/repositories/permission_repository_impl.dart';
import 'package:flutter_template/data/repositories/settings_repository_impl.dart';
import 'package:flutter_template/data/repositories/shared_prefs_repository_impl.dart';
import 'package:flutter_template/data/repositories/storage_repository_impl.dart';
import 'package:flutter_template/domain/repositories/about_repository.dart';
import 'package:flutter_template/domain/repositories/analytics_repository.dart';
import 'package:flutter_template/domain/repositories/log_repository.dart';
import 'package:flutter_template/domain/repositories/network_repository.dart';
import 'package:flutter_template/domain/repositories/permission_repository.dart';
import 'package:flutter_template/domain/repositories/settings_repository.dart';
import 'package:flutter_template/domain/repositories/shared_prefs_repository.dart';
import 'package:flutter_template/domain/repositories/storage_repository.dart';
import 'package:flutter_template/injector/injector.dart';
import 'package:get_it/get_it.dart';

/// Repository Registration.
///
/// Repositories are to handle datasources.
class RepositoryModule with InjectorMixin {
  void register(GetIt sl) {
    sl.registerLazySingleton<AboutRepository>(
      () => AboutRepositoryImpl(
        logRepository: sl(),
        androidDataSource: sl(instanceName: android),
        iosDataSource: sl(instanceName: ios),
      ),
    );

    sl.registerLazySingleton<AnalyticsRepository>(
      () => AnalyticsRepositoryImpl(
        remoteDataSource: sl(instanceName: remote),
        sharedPrefsRepository: sl(),
      ),
    );

    sl.registerLazySingleton<LogRepository>(
      () => LogRepositoryImpl(
        analyticsRepository: sl(),
        localDataSource: sl(instanceName: local),
        sharedPrefsRepository: sl(),
      ),
    );

    sl.registerLazySingleton<NetworkRepository>(
      () => NetworkRepositoryImpl(
        androidDataSource: sl(instanceName: android),
        iosDataSource: sl(instanceName: ios),
      ),
    );

    sl.registerLazySingleton<PermissionRepository>(
      () => PermissionRepositoryImpl(
        androidAboutDataSource: sl(instanceName: android),
      ),
    );

    sl.registerLazySingleton<SettingsRepository>(
      () => SettingsRepositoryImpl(
        localDataSource: sl(instanceName: local),
      ),
    );

    sl.registerLazySingleton<SharedPrefsRepository>(
      SharedPrefsRepositoryImpl.new,
    );

    sl.registerLazySingleton<StorageRepository>(
      () => StorageRepositoryImpl(
        androidDataSource: sl(instanceName: android),
        iosDataSource: sl(instanceName: ios),
      ),
    );
  }
}
