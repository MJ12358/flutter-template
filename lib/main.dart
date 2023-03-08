import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_extensionz/flutter_extensionz.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_template/core/bloc_observer.dart';
import 'package:flutter_template/domain/core/database.dart';
import 'package:flutter_template/injector.dart';
import 'package:flutter_template/presentation/extensions/localization_extension.dart';
import 'package:flutter_template/presentation/ui/app/app.dart';
import 'package:flutter_template/presentation/widgets/progress_indicator/progress_indicator.dart';
import 'package:flutter_themez/flutter_themez.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injector.init();
  await Injector.sl<Database>(instanceName: Injector.local).init();
  if (kDebugMode) {
    Bloc.observer = AppBlocObserver();
  }
  runApp(const _Main());
}

class _Main extends StatelessWidget {
  const _Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppBloc>(
      create: (_) => Injector.sl<AppBloc>()..add(const AppInitialized()),
      child: const _MainView(),
    );
  }
}

class _MainView extends StatelessWidget {
  const _MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      buildWhen: (AppState previous, AppState current) {
        return previous.settings != current.settings;
      },
      builder: (BuildContext context, AppState state) {
        final FlutterThemez theme = FlutterThemez(
          primaryColor: state.settings.primaryColor,
          secondaryColor: state.settings.secondaryColor,
        );

        return MaterialApp(
          color: theme.primaryColor,
          debugShowMaterialGrid: state.settings.showMaterialGrid,
          home: BlocBuilder<AppBloc, AppState>(
            buildWhen: (AppState previous, AppState current) {
              return previous.status != current.status;
            },
            builder: (BuildContext context, AppState state) {
              switch (state.status) {
                case AppStatus.loading:
                  return const CustomProgressIndicator();
                default:
                  return const AppView();
              }
            },
          ),
          localizationsDelegates: AppLocalizations.localizationsDelegates +
              FlutterExtensionzLocalizations.localizationsDelegates,
          onGenerateTitle: (BuildContext context) {
            return context.l10n.appTitle;
          },
          restorationScopeId: 'app',
          showPerformanceOverlay: state.settings.showPerformanceOverlay,
          showSemanticsDebugger: state.settings.showSemanticOverlay,
          supportedLocales: AppLocalizations.supportedLocales,
          theme: theme.light(),
          darkTheme: theme.dark(),
          themeMode:
              state.settings.darkMode ? ThemeMode.dark : ThemeMode.system,
        );
      },
    );
  }
}
