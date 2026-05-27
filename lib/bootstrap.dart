import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/core/bloc_observer.dart';
import 'package:flutter_template/core/constants.dart';
import 'package:flutter_template/domain/repositories/log_repository.dart';

class _HttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (_, _, _) => true;
  }
}

class Bootstrap {
  const Bootstrap({
    required this._logRepository,
  });

  final LogRepository _logRepository;

  Future<void> call(FutureOr<Widget> Function() builder) async {
    if (Build.isDebug) {
      Bloc.observer = AppBlocObserver();
      HttpOverrides.global = _HttpOverrides();
    }

    // Log exceptions on a flutter error
    FlutterError.onError = (FlutterErrorDetails details) {
      _logRepository.error(
        message: details.exceptionAsString(),
        trace: details.stack,
      );
    };

    // Log exceptions on a platform error
    PlatformDispatcher.instance.onError =
        (
          Object exception,
          StackTrace stackTrace,
        ) {
          _logRepository.error(
            message: exception,
            trace: stackTrace,
          );
          return true;
        };

    // Log exceptions on a dart error
    Isolate.current.addErrorListener(
      RawReceivePort((Object pair) {
        if (pair is List<dynamic> && pair.length == 2) {
          final List<dynamic> error = pair;
          _logRepository.error(
            message: error.first,
            trace: error.last,
          );
        }
      }).sendPort,
    );

    runApp(await builder());
  }
}
