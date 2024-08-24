part of '../settings.dart';

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
