import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_template/core/bloc_observer.dart';
import 'package:flutter_template/core/constants.dart';
import 'package:flutter_template/domain/core/database.dart';
import 'package:flutter_template/domain/repositories/analytics_repository.dart';
import 'package:flutter_template/injector.dart';

class Bootstrap {
  const Bootstrap({
    required AnalyticsRepository analyticsRepository,
  }) : _analyticsRepository = analyticsRepository;

  final AnalyticsRepository _analyticsRepository;

  Future<void> call(FutureOr<Widget> Function() builder) async {
    final WidgetsBinding binding = WidgetsFlutterBinding.ensureInitialized();

    FlutterNativeSplash.preserve(widgetsBinding: binding);

    // ensure `Injector.init()` is run in `main`
    await Injector.sl<Database>(instanceName: Injector.local).init();
    await Injector.sl<Database>(instanceName: Injector.remote).init();

    if (Build.isDebug) {
      Bloc.observer = AppBlocObserver();
    }

    FlutterError.onError = (FlutterErrorDetails details) {
      log(details.exceptionAsString(), stackTrace: details.stack);

      _analyticsRepository.logException(
        details: details.exceptionAsString(),
        stackTrace: details.stack,
      );
    };

    runApp(await builder());
  }
}
