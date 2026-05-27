import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_template/bootstrap.dart';
import 'package:flutter_template/injector/injector.dart';
import 'package:flutter_template/l10n/app_localizations.dart';
import 'package:flutter_template/presentation/extensions/localization_extension.dart';
import 'package:flutter_template/presentation/ui/app/app.dart';
import 'package:flutter_template/presentation/ui/error/error.dart';
import 'package:flutter_template/presentation/ui/navigation/navigation.dart';
import 'package:flutter_template/presentation/ui/welcome/welcome.dart';
import 'package:flutter_themez/flutter_themez.dart';
import 'package:flutter_widgetz/flutter_widgetz.dart';

Future<void> main() async {
  try {
    // Initialize Flutter bindings first.
    final WidgetsBinding binding = WidgetsFlutterBinding.ensureInitialized();
    // Preserve the splash screen until initialization is complete.
    FlutterNativeSplash.preserve(widgetsBinding: binding);
    // Initialize the dependency injector and all dependencies.
    await Injector.init();
    // Bootstrap the app, which will run the main view.
    await Injector.sl<Bootstrap>().call(_Main.new);
  } catch (e, s) {
    // If something goes wrong during initialization, we want to remove the
    // splash screen and show an error message.
    FlutterNativeSplash.remove();
    runApp(
      ErrorView(
        error: e,
        stackTrace: s,
      ),
    );
  }
}

/// Storing this here prevents this issue:
///
/// https://stackoverflow.com/questions/60927958/flutter-being-sent-back-to-initial-page-after-hot-reload
///
/// And also allows us to access the navigator from outside of the widget tree.
abstract final class NavigatorKeyHolder {
  static final GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();
}

class _Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider<StateStreamableSource<Object>>>[
        BlocProvider<AppBloc>(
          create: (_) => Injector.sl<AppBloc>()..onInit(),
        ),
        BlocProvider<NavigationBloc>(
          create: (_) => Injector.sl<NavigationBloc>(),
        ),
      ],
      child: _MainView(NavigatorKeyHolder.key),
    );
  }
}

class _MainView extends StatelessWidget {
  const _MainView(this._navigatorKey);

  final GlobalKey<NavigatorState> _navigatorKey;

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppState>(
      listenWhen: (AppState previous, AppState current) {
        return previous.status == AppStatus.initializing &&
            current.status != AppStatus.initializing;
      },
      listener: (BuildContext context, AppState state) {
        FlutterNativeSplash.remove();
      },
      buildWhen: (AppState previous, AppState current) {
        return previous.settings != current.settings ||
            previous.sharedPrefs.debug != current.sharedPrefs.debug ||
            (previous.status == AppStatus.initializing &&
                current.status != AppStatus.initializing);
      },
      builder: (BuildContext context, AppState state) {
        if (state.status == AppStatus.initializing) {
          return CustomProgressIndicator.circular();
        }

        final FlutterThemez theme = FlutterThemez(
          primaryColor: Color(state.settings.primaryColor),
          secondaryColor: Color(state.settings.secondaryColor),
        );

        return MaterialApp(
          navigatorKey: _navigatorKey,
          builder: (BuildContext context, Widget? child) {
            return BlocListener<AppBloc, AppState>(
              listenWhen: (AppState previous, AppState current) {
                return previous.status != current.status;
              },
              listener: _pushPage,
              child: child,
            );
          },
          color: theme.primaryColor,
          debugShowCheckedModeBanner: false,
          debugShowMaterialGrid: state.sharedPrefs.debug.showMaterialGrid,
          home: _getInitialView(state),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          onGenerateTitle: (BuildContext context) {
            return context.l10n.appTitle;
          },
          restorationScopeId: 'app',
          showPerformanceOverlay:
              state.sharedPrefs.debug.showPerformanceOverlay,
          showSemanticsDebugger: state.sharedPrefs.debug.showSemanticOverlay,
          supportedLocales: AppLocalizations.supportedLocales,
          theme: theme.light(),
          darkTheme: theme.dark(),
          themeMode: state.settings.darkMode ? ThemeMode.dark : ThemeMode.light,
        );
      },
    );
  }

  Widget _getInitialView(AppState state) {
    switch (state.status) {
      case AppStatus.initializing:
        return CustomProgressIndicator.circular();
      case AppStatus.needsWelcome:
        return const WelcomeView();
      default:
        return const AppView();
    }
  }

  /// Inspired by:
  ///
  /// https://github.com/felangel/bloc/blob/master/examples/flutter_login/lib/app.dart
  void _pushPage(BuildContext context, AppState state) {
    Widget? page;
    switch (state.status) {
      case AppStatus.success:
      case AppStatus.reset:
        page = const AppView();
      case AppStatus.needsWelcome:
        page = const WelcomeView();
      // Any other case, set page to null.
      default:
        page = null;
    }
    if (page != null) {
      _navigator.pushAndRemoveUntil(
        MaterialPageRoute<void>(
          builder: (_) => page!,
        ),
        (_) => false,
      );
    }
  }
}
