import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/core/constants.dart';
import 'package:flutter_template/presentation/extensions/localization_extension.dart';
import 'package:flutter_template/presentation/ui/settings/settings.dart';
import 'package:flutter_widgetz/flutter_widgetz.dart';

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
          onChanged: (bool value) => context
              .read<SettingsBloc>()
              .add(SettingsMaterialGridChanged(showMaterialGrid: value)),
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
          onChanged: (bool value) => context.read<SettingsBloc>().add(
                SettingsPerformanceOverlayChanged(
                  showPerformanceOverlay: value,
                ),
              ),
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
          onChanged: (bool value) => context.read<SettingsBloc>().add(
                SettingsSemanticOverlayChanged(showSemanticOverlay: value),
              ),
        );
      },
    );
  }
}
