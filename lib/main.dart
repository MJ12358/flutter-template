import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_template_bloc/core/bloc_observer.dart';
import 'package:flutter_template_bloc/injector.dart';
import 'package:flutter_template_bloc/presentation/extensions/localization_extension.dart';
import 'package:flutter_template_bloc/presentation/ui/app/app.dart';
import 'package:flutter_template_bloc/presentation/widgets/progress_indicator/progress_indicator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injector.init();
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
    return MaterialApp(
      color: Colors.blue,
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
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      onGenerateTitle: (BuildContext context) {
        return context.l10n.appTitle;
      },
      restorationScopeId: 'app',
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
