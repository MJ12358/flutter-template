import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_extensionz/flutter_extensionz.dart';
import 'package:flutter_template/injector.dart';
import 'package:flutter_template/presentation/extensions/localization_extension.dart';
import 'package:flutter_template/presentation/ui/app/app.dart';
import 'package:flutter_template/presentation/ui/settings/settings.dart';
import 'package:flutter_widgetz/flutter_widgetz.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocProvider<SettingsBloc>(
      create: (_) =>
          Injector.sl<SettingsBloc>()..add(const SettingsInitialized()),
      child: BlocListener<SettingsBloc, SettingsState>(
        listenWhen: (SettingsState previous, SettingsState current) {
          return previous.status != current.status;
        },
        listener: (BuildContext context, SettingsState state) {
          if (state.status == SettingsStatus.failure) {
            context.showSnackBar(Text(state.errorMessage));
          } else if (state.status == SettingsStatus.exportSuccess) {
            context.showSnackBar(Text(context.l10n.exportSuccess));
          } else if (state.status == SettingsStatus.importSuccess) {
            context.safePushAndRemove(const AppView());
          }
        },
        child: CustomScaffold(
          semanticLabel: context.l10n.settingsView,
          appBar: CustomAppBar(
            title: Text(context.l10n.settings),
          ),
          body: const SettingsBody(),
        ),
      ),
    );
  }
}
