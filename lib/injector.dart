import 'package:flutter_template/bootstrap.dart';
import 'package:flutter_template/data/datasources/android/android_about_datasource.dart';
import 'package:flutter_template/data/datasources/android/android_file_datasource.dart';
import 'package:flutter_template/data/datasources/android/android_network_datasource.dart';
import 'package:flutter_template/data/datasources/firebase/firebase_analytics_datasource.dart';
import 'package:flutter_template/data/datasources/firebase/firebase_database.dart';
import 'package:flutter_template/data/datasources/ios/ios_about_datasource.dart';
import 'package:flutter_template/data/datasources/ios/ios_file_datasource.dart';
import 'package:flutter_template/data/datasources/ios/ios_network_datasource.dart';
import 'package:flutter_template/data/datasources/linux/linux_about_datasource.dart';
import 'package:flutter_template/data/datasources/linux/linux_file_datasource.dart';
import 'package:flutter_template/data/datasources/linux/linux_network_datasource.dart';
import 'package:flutter_template/data/datasources/sembast/sembast_database.dart';
import 'package:flutter_template/data/datasources/sembast/sembast_settings_datasource.dart';
import 'package:flutter_template/data/datasources/web/web_about_datasource.dart';
import 'package:flutter_template/data/datasources/web/web_analytics_datasource.dart';
import 'package:flutter_template/data/datasources/windows/windows_about_datasource.dart';
import 'package:flutter_template/data/datasources/windows/windows_file_datasource.dart';
import 'package:flutter_template/data/datasources/windows/windows_network_datasource.dart';
import 'package:flutter_template/data/repositories/about_repository_impl.dart';
import 'package:flutter_template/data/repositories/analytics_repository_impl.dart';
import 'package:flutter_template/data/repositories/file_repository_impl.dart';
import 'package:flutter_template/data/repositories/network_repository_impl.dart';
import 'package:flutter_template/data/repositories/permission_repository_impl.dart';
import 'package:flutter_template/data/repositories/porter_repository_impl.dart';
import 'package:flutter_template/data/repositories/settings_repository_impl.dart';
import 'package:flutter_template/domain/core/database.dart';
import 'package:flutter_template/domain/datasources/about_datasource.dart';
import 'package:flutter_template/domain/datasources/analytics_datasource.dart';
import 'package:flutter_template/domain/datasources/file_datasource.dart';
import 'package:flutter_template/domain/datasources/network_datasource.dart';
import 'package:flutter_template/domain/datasources/settings_datasource.dart';
import 'package:flutter_template/domain/repositories/about_repository.dart';
import 'package:flutter_template/domain/repositories/analytics_repository.dart';
import 'package:flutter_template/domain/repositories/file_repository.dart';
import 'package:flutter_template/domain/repositories/network_repository.dart';
import 'package:flutter_template/domain/repositories/permission_repository.dart';
import 'package:flutter_template/domain/repositories/porter_repository.dart';
import 'package:flutter_template/domain/repositories/settings_repository.dart';
import 'package:flutter_template/domain/usecases/porter/export_usecase.dart';
import 'package:flutter_template/domain/usecases/porter/import_usecase.dart';
import 'package:flutter_template/domain/usecases/settings/get_settings_usecase.dart';
import 'package:flutter_template/domain/usecases/settings/set_settings_usecase.dart';
import 'package:flutter_template/presentation/ui/app/app.dart';
import 'package:flutter_template/presentation/ui/settings/settings.dart';
import 'package:flutter_template/presentation/ui/welcome/welcome.dart';
import 'package:get_it/get_it.dart';

class Injector {
  Injector._();

  static final GetIt sl = GetIt.instance;
  static const String local = 'local';
  static const String remote = 'remote';
  static const String android = 'android';
  static const String ios = 'ios';
  static const String linux = 'linux';
  static const String web = 'web';
  static const String windows = 'windows';

  static Future<void> init() async {
    /// Bootstrap Registration
    ///
    /// Used to bootstrap the application.

    sl.registerLazySingleton<Bootstrap>(
      () => Bootstrap(
        analyticsRepository: sl(),
      ),
    );

    /// Database Registration
    ///
    /// Used to initialized any databases.

    sl.registerSingletonAsync<Database>(
      () => SembastDatabase().init(),
      instanceName: local,
    );

    sl.registerSingletonAsync<Database>(
      () => FirebaseDatabase().init(),
      instanceName: remote,
    );

    /// Bloc Registration
    ///
    /// The [AppBloc] should be a singleton.
    /// All other blocs should be factories.

    sl.registerLazySingleton<AppBloc>(
      () => AppBloc(
        getSettingsUseCase: sl(),
        setSettingsUseCase: sl(),
      ),
    );

    sl.registerFactory<SettingsBloc>(
      () => SettingsBloc(
        getSettingsUseCase: sl(),
        setSettingsUseCase: sl(),
        exportUseCase: sl(),
        importUseCase: sl(),
      ),
    );

    sl.registerFactory<WelcomeBloc>(
      () => WelcomeBloc(
        getSettingsUseCase: sl(),
        setSettingsUseCase: sl(),
      ),
    );

    /// Use Case Registration
    ///
    ///

    // porter

    sl.registerLazySingleton<ExportUseCase>(
      () => ExportUseCaseImpl(
        analyticsRepository: sl(),
        fileRepository: sl(),
        permissionRepository: sl(),
        porterRepository: sl(),
      ),
    );

    sl.registerLazySingleton<ImportUseCase>(
      () => ImportUseCaseImpl(
        analyticsRepository: sl(),
        fileRepository: sl(),
        porterRepository: sl(),
      ),
    );

    // settings

    sl.registerLazySingleton<GetSettingsUseCase>(
      () => GetSettingsUseCaseImpl(
        analyticsRepository: sl(),
        settingsRepository: sl(),
      ),
    );

    sl.registerLazySingleton<SetSettingsUseCase>(
      () => SetSettingsUseCaseImpl(
        analyticsRepository: sl(),
        settingsRepository: sl(),
      ),
    );

    /// Repository Registration
    ///
    /// Repositories are to handle datasources.

    sl.registerLazySingleton<AboutRepository>(
      () => AboutRepositoryImpl(
        androidDataSource: sl(instanceName: android),
        iosDataSource: sl(instanceName: ios),
        linuxDataSource: sl(instanceName: linux),
        windowsDataSource: sl(instanceName: windows),
        webDataSource: sl(instanceName: web),
      ),
    );

    sl.registerLazySingleton<AnalyticsRepository>(
      () => AnalyticsRepositoryImpl(
        remoteDataSource: sl(instanceName: remote),
        webDataSource: sl(instanceName: web),
        settingsRepository: sl(),
      ),
    );

    sl.registerLazySingleton<FileRepository>(
      () => FileRepositoryImpl(
        androidDataSource: sl(instanceName: android),
        iosDataSource: sl(instanceName: ios),
        linuxDataSource: sl(instanceName: linux),
        windowsDataSource: sl(instanceName: windows),
      ),
    );

    sl.registerLazySingleton<NetworkRepository>(
      () => NetworkRepositoryImpl(
        androidDataSource: sl(instanceName: android),
        iosDataSource: sl(instanceName: ios),
        linuxDataSource: sl(instanceName: linux),
        windowsDataSource: sl(instanceName: windows),
      ),
    );

    sl.registerLazySingleton<PermissionRepository>(
      PermissionRepositoryImpl.new,
    );

    sl.registerLazySingleton<PorterRepository>(
      () => PorterRepositoryImpl(
        localDataSource: sl(instanceName: local),
      ),
    );

    sl.registerLazySingleton<SettingsRepository>(
      () => SettingsRepositoryImpl(
        localDataSource: sl(instanceName: local),
      ),
    );

    /// Datasource Registration
    ///
    /// Datasources retrieve data.

    // local

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

    // android

    sl.registerLazySingleton<AboutDataSource>(
      AndroidAboutDataSource.new,
      instanceName: android,
    );

    sl.registerLazySingleton<FileDataSource>(
      AndroidFileDataSource.new,
      instanceName: android,
    );

    sl.registerLazySingleton<NetworkDataSource>(
      AndroidNetworkDataSource.new,
      instanceName: android,
    );

    // ios

    sl.registerLazySingleton<AboutDataSource>(
      IOSAboutDataSource.new,
      instanceName: ios,
    );

    sl.registerLazySingleton<FileDataSource>(
      IOSFileDataSource.new,
      instanceName: ios,
    );

    sl.registerLazySingleton<NetworkDataSource>(
      IOSNetworkDataSource.new,
      instanceName: ios,
    );

    // linux

    sl.registerLazySingleton<AboutDataSource>(
      LinuxAboutDataSource.new,
      instanceName: linux,
    );

    sl.registerLazySingleton<FileDataSource>(
      LinuxFileDataSource.new,
      instanceName: linux,
    );

    sl.registerLazySingleton<NetworkDataSource>(
      LinuxNetworkDataSource.new,
      instanceName: linux,
    );

    // web

    sl.registerLazySingleton<AboutDataSource>(
      WebAboutDataSource.new,
      instanceName: web,
    );

    sl.registerLazySingleton<AnalyticsDataSource>(
      WebAnalyticsDataSource.new,
      instanceName: web,
    );

    // windows

    sl.registerLazySingleton<AboutDataSource>(
      WindowsAboutDataSource.new,
      instanceName: windows,
    );

    sl.registerLazySingleton<FileDataSource>(
      WindowsFileDataSource.new,
      instanceName: windows,
    );

    sl.registerLazySingleton<NetworkDataSource>(
      WindowsNetworkDataSource.new,
      instanceName: windows,
    );
  }
}
