import 'dart:async';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/core/bloc_observer.dart';
import 'package:flutter_template/core/constants.dart';
import 'package:flutter_template/domain/repositories/analytics_repository.dart';

class _HttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (_, __, ___) => true;
  }
}

class Bootstrap {
  const Bootstrap({
    required AnalyticsRepository analyticsRepository,
  }) : _analyticsRepository = analyticsRepository;

  final AnalyticsRepository _analyticsRepository;

  Future<void> call(FutureOr<Widget> Function() builder) async {
    if (Build.isDebug) {
      Bloc.observer = AppBlocObserver();
      HttpOverrides.global = _HttpOverrides();
    }

    FlutterError.onError = (FlutterErrorDetails details) {
      _analyticsRepository.logException(
        details: details.exceptionAsString(),
        stackTrace: details.stack,
      );
    };

    runApp(await builder());
  }
}
