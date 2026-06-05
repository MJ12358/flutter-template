import 'package:flutter_template/data/datasources/android/android_about_datasource.dart';
import 'package:flutter_template/data/datasources/android/android_network_datasource.dart';
import 'package:flutter_template/data/datasources/android/android_storage_datasource.dart';
import 'package:flutter_template/data/datasources/firebase/firebase_analytics_datasource.dart';
import 'package:flutter_template/data/datasources/ios/ios_about_datasource.dart';
import 'package:flutter_template/data/datasources/ios/ios_network_datasource.dart';
import 'package:flutter_template/data/datasources/ios/ios_storage_datasource.dart';
import 'package:flutter_template/data/datasources/sembast/sembast_log_datasource.dart';
import 'package:flutter_template/data/datasources/sembast/sembast_settings_datasource.dart';
import 'package:flutter_template/domain/datasources/about_datasource.dart';
import 'package:flutter_template/domain/datasources/analytics_datasource.dart';
import 'package:flutter_template/domain/datasources/log_datasource.dart';
import 'package:flutter_template/domain/datasources/network_datasource.dart';
import 'package:flutter_template/domain/datasources/settings_datasource.dart';
import 'package:flutter_template/domain/datasources/storage_datasource.dart';
import 'package:flutter_template/injector/injector.dart';
import 'package:get_it/get_it.dart';

/// Datasource Registration.
///
/// Datasources retrieve data.
class DataSourceModule with InjectorMixin {
  Future<void> register(GetIt sl) async {
    // android

    sl.registerLazySingleton<AboutDataSource>(
      AndroidAboutDataSource.new,
      instanceName: android,
    );

    sl.registerLazySingleton<NetworkDataSource>(
      AndroidNetworkDataSource.new,
      instanceName: android,
    );

    sl.registerLazySingleton<StorageDataSource>(
      AndroidStorageDataSource.new,
      instanceName: android,
    );

    // ios

    sl.registerLazySingleton<AboutDataSource>(
      IOSAboutDataSource.new,
      instanceName: ios,
    );

    sl.registerLazySingleton<NetworkDataSource>(
      IOSNetworkDataSource.new,
      instanceName: ios,
    );

    sl.registerLazySingleton<StorageDataSource>(
      IOSStorageDataSource.new,
      instanceName: ios,
    );

    // local

    sl.registerLazySingleton<LogDataSource>(
      () => SembastLogDataSource(
        database: sl(instanceName: local),
      ),
      instanceName: local,
    );

    sl.registerLazySingleton<SettingsDataSource>(
      () => SembastSettingsDataSource(
        database: sl(instanceName: local),
      ),
      instanceName: local,
    );

    // remote

    sl.registerLazySingleton<AnalyticsDataSource>(
      FirebaseAnalyticsDataSource.new,
      instanceName: remote,
    );
  }
}
