part of '../settings.dart';

class SettingsCommonSection extends StatelessWidget {
  const SettingsCommonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsSection(
      title: context.l10n.common,
      tiles: const <Widget>[
        _DarkMode(),
        _PrimaryColor(),
        _SecondaryColor(),
        _ImmersiveMode(),
      ],
    );
  }
}

class _DarkMode extends StatelessWidget {
  const _DarkMode();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      buildWhen: (SettingsState previous, SettingsState current) {
        return previous.settings.darkMode != current.settings.darkMode;
      },
      builder: (BuildContext context, SettingsState state) {
        return SettingsTile.switched(
          title: Text(context.l10n.darkMode),
          leading: state.settings.darkMode
              ? const Icon(Icons.dark_mode)
              : const Icon(Icons.light_mode),
          value: state.settings.darkMode,
          onChanged: (bool value) =>
              context.read<SettingsBloc>().onDarkModeChanged(value: value),
        );
      },
    );
  }
}

class _PrimaryColor extends StatelessWidget {
  const _PrimaryColor();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      buildWhen: (SettingsState previous, SettingsState current) {
        return previous.settings.primaryColor != current.settings.primaryColor;
      },
      builder: (BuildContext context, SettingsState state) {
        return SettingsTile.colorPicker(
          context: context,
          color: Color(state.settings.primaryColor),
          defaultColor: const Color(Style.primaryColor),
          title: Text(context.l10n.primaryColor),
          onChanged: (Color color) => context
              .read<SettingsBloc>()
              .onPrimaryColorChanged(value: color.value),
        );
      },
    );
  }
}

class _SecondaryColor extends StatelessWidget {
  const _SecondaryColor();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      buildWhen: (SettingsState previous, SettingsState current) {
        return previous.settings.secondaryColor !=
            current.settings.secondaryColor;
      },
      builder: (BuildContext context, SettingsState state) {
        return SettingsTile.colorPicker(
          context: context,
          color: Color(state.settings.secondaryColor),
          defaultColor: const Color(Style.secondaryColor),
          title: Text(context.l10n.secondaryColor),
          onChanged: (Color color) => context
              .read<SettingsBloc>()
              .onSecondaryColorChanged(value: color.value),
        );
      },
    );
  }
}

class _ImmersiveMode extends StatelessWidget {
  const _ImmersiveMode();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      buildWhen: (SettingsState previous, SettingsState current) {
        return previous.settings.immersiveMode !=
            current.settings.immersiveMode;
      },
      builder: (BuildContext context, SettingsState state) {
        return SettingsTile.immersiveMode(
          title: Text(context.l10n.immersiveMode),
          value: state.settings.immersiveMode,
          onChanged: (bool value) =>
              context.read<SettingsBloc>().onImmersiveModeChanged(value: value),
        );
      },
    );
  }
}
