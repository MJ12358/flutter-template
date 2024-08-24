part of '../settings.dart';

class SettingsDeveloperSection extends StatelessWidget {
  const SettingsDeveloperSection({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Build.isDebug) {
      return const SizedBox();
    }

    return SettingsSection(
      title: context.l10n.developer,
      tiles: const <Widget>[
        _MaterialGrid(),
        _PerformanceOverlay(),
        _SemanticOverlay(),
      ],
    );
  }
}

class _MaterialGrid extends StatelessWidget {
  const _MaterialGrid();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      buildWhen: (SettingsState previous, SettingsState current) {
        return previous.settings.showMaterialGrid !=
            current.settings.showMaterialGrid;
      },
      builder: (BuildContext context, SettingsState state) {
        return SettingsTile.switched(
          title: Text(context.l10n.materialGrid),
          leading: const Icon(Icons.grid_3x3),
          value: state.settings.showMaterialGrid,
          onChanged: (bool value) =>
              context.read<SettingsBloc>().onMaterialGridChanged(value: value),
        );
      },
    );
  }
}

class _PerformanceOverlay extends StatelessWidget {
  const _PerformanceOverlay();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      buildWhen: (SettingsState previous, SettingsState current) {
        return previous.settings.showPerformanceOverlay !=
            current.settings.showPerformanceOverlay;
      },
      builder: (BuildContext context, SettingsState state) {
        return SettingsTile.switched(
          title: Text(context.l10n.performanceOverlay),
          leading: const Icon(Icons.perm_device_information),
          value: state.settings.showPerformanceOverlay,
          onChanged: (bool value) => context
              .read<SettingsBloc>()
              .onPerformanceOverlayChanged(value: value),
        );
      },
    );
  }
}

class _SemanticOverlay extends StatelessWidget {
  const _SemanticOverlay();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      buildWhen: (SettingsState previous, SettingsState current) {
        return previous.settings.showSemanticOverlay !=
            current.settings.showSemanticOverlay;
      },
      builder: (BuildContext context, SettingsState state) {
        return SettingsTile.switched(
          title: Text(context.l10n.semanticOverlay),
          leading: const Icon(Icons.layers),
          value: state.settings.showSemanticOverlay,
          onChanged: (bool value) => context
              .read<SettingsBloc>()
              .onSemanticOverlayChanged(value: value),
        );
      },
    );
  }
}
