import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_extensionz/flutter_extensionz.dart';
import 'package:flutter_template/presentation/extensions/localization_extension.dart';
import 'package:flutter_template/presentation/ui/app/app.dart';

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppBloc, AppState>(
      listenWhen: (AppState previous, AppState current) {
        return previous.status != current.status;
      },
      listener: (BuildContext context, AppState state) {
        if (state.status == AppStatus.failure) {
          context.showSnackBar(Text(state.errorMessage));
        }
      },
      child: Scaffold(
        body: Center(
          child: Text(context.l10n.appTitle),
        ),
      ),
    );
  }
}
