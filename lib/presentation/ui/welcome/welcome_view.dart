import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_extensionz/flutter_extensionz.dart';
import 'package:flutter_template/injector.dart';
import 'package:flutter_template/presentation/extensions/localization_extension.dart';
import 'package:flutter_template/presentation/ui/app/app.dart';
import 'package:flutter_template/presentation/ui/welcome/welcome.dart';
import 'package:flutter_widgetz/flutter_widgetz.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WelcomeBloc>(
      create: (_) =>
          Injector.sl<WelcomeBloc>()..add(const WelcomeInitialized()),
      child: BlocListener<WelcomeBloc, WelcomeState>(
        listenWhen: (WelcomeState previous, WelcomeState current) {
          return previous.status != current.status;
        },
        listener: (BuildContext context, WelcomeState state) {
          if (state.status == WelcomeStatus.failure) {
            context.showSnackBar(Text(state.errorMessage));
          } else if (state.status == WelcomeStatus.complete) {
            context.pushAndRemove(const AppView());
          }
        },
        child: CustomScaffold(
          semanticLabel: context.l10n.welcomeView,
          body: const WelcomeBody(),
        ),
      ),
    );
  }
}
