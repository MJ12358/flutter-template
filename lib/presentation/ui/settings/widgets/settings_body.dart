import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/presentation/ui/settings/settings.dart';
import 'package:flutter_widgetz/flutter_widgetz.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      buildWhen: (SettingsState previous, SettingsState current) {
        return previous.status != current.status;
      },
      builder: (BuildContext context, SettingsState state) {
        if (state.status == SettingsStatus.loading) {
          return CustomProgressIndicator.circular();
        }

        return const SettingsList(
          sections: <Widget>[
            SettingsCommonSection(),
            SettingsMiscSection(),
            SettingsDeveloperSection(),
            SettingsLegalSection(),
          ],
        );
      },
    );
  }
}
