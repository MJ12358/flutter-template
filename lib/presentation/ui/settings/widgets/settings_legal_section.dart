part of '../settings.dart';

class SettingsLegalSection extends StatelessWidget {
  const SettingsLegalSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsSection(
      title: context.l10n.legal,
      tiles: const <Widget>[
        _Licenses(),
        _Analytics(),
      ],
    );
  }
}

class _Licenses extends StatelessWidget {
  const _Licenses();

  @override
  Widget build(BuildContext context) {
    return SettingsTile.licenses(context: context);
  }
}

class _Analytics extends StatelessWidget {
  const _Analytics();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      buildWhen: (SettingsState previous, SettingsState current) {
        return previous.sharedPrefs.app.analyticsEnabled !=
            current.sharedPrefs.app.analyticsEnabled;
      },
      builder: (BuildContext context, SettingsState state) {
        return SettingsTile.switched(
          title: Text(context.l10n.analytics),
          leading: const Icon(Icons.analytics_outlined),
          value: state.sharedPrefs.app.analyticsEnabled,
          onChanged: (bool value) =>
              context.read<SettingsBloc>().onAnalyticsChanged(value: value),
        );
      },
    );
  }
}
