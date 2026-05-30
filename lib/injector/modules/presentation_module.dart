import 'package:flutter_template/injector/injector.dart';
import 'package:flutter_template/presentation/ui/app/app.dart';
import 'package:flutter_template/presentation/ui/navigation/navigation.dart';
import 'package:flutter_template/presentation/ui/settings/settings.dart';
import 'package:flutter_template/presentation/ui/welcome/welcome.dart';
import 'package:get_it/get_it.dart';

/// Presentation (Bloc) Registration.
///
/// The `AppBloc` should be a singleton.
/// All other blocs should be factories.
class PresentationModule with InjectorMixin {
  Future<void> register(GetIt sl) async {
    sl.registerLazySingleton<AppBloc>(
      () => AppBloc(
        settingsRepository: sl(),
        sharedPrefsRepository: sl(),
      ),
    );

    sl.registerSingletonAsync<NavigationBloc>(
      () => NavigationBloc.create(
        sharedPrefsRepository: sl(),
      ),
    );

    sl.registerFactory<SettingsBloc>(
      () => SettingsBloc(
        settingsRepository: sl(),
        sharedPrefsRepository: sl(),
      ),
    );

    sl.registerFactory<WelcomeBloc>(
      () => WelcomeBloc(
        sharedPrefsRepository: sl(),
      ),
    );
  }
}
