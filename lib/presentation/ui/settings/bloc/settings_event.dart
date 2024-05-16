part of 'settings_bloc.dart';

sealed class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => <Object>[];
}

final class SettingsInitialized extends SettingsEvent {
  const SettingsInitialized();
}

final class SettingsFailed extends SettingsEvent {
  const SettingsFailed({
    required this.message,
  });

  final String message;

  @override
  List<Object> get props => <Object>[
        message,
      ];
}

final class SettingsChanged extends SettingsEvent {
  const SettingsChanged({
    required this.settings,
  });

  final Settings settings;

  @override
  List<Object> get props => <Object>[
        settings,
      ];
}

final class SettingsDarkModeChanged extends SettingsEvent {
  const SettingsDarkModeChanged({
    required this.darkMode,
  });

  final bool darkMode;

  @override
  List<Object> get props => <Object>[
        darkMode,
      ];
}

final class SettingsPrimaryColorChanged extends SettingsEvent {
  const SettingsPrimaryColorChanged({
    required this.color,
  });

  final int color;

  @override
  List<Object> get props => <Object>[
        color,
      ];
}

final class SettingsSecondaryColorChanged extends SettingsEvent {
  const SettingsSecondaryColorChanged({
    required this.color,
  });

  final int color;

  @override
  List<Object> get props => <Object>[
        color,
      ];
}

final class SettingsMaterialGridChanged extends SettingsEvent {
  const SettingsMaterialGridChanged({
    required this.showMaterialGrid,
  });

  final bool showMaterialGrid;

  @override
  List<Object> get props => <Object>[
        showMaterialGrid,
      ];
}

final class SettingsPerformanceOverlayChanged extends SettingsEvent {
  const SettingsPerformanceOverlayChanged({
    required this.showPerformanceOverlay,
  });

  final bool showPerformanceOverlay;

  @override
  List<Object> get props => <Object>[
        showPerformanceOverlay,
      ];
}

final class SettingsImmersiveModeChanged extends SettingsEvent {
  const SettingsImmersiveModeChanged({
    required this.immersiveMode,
  });

  final bool immersiveMode;

  @override
  List<Object> get props => <Object>[
        immersiveMode,
      ];
}

final class SettingsSemanticOverlayChanged extends SettingsEvent {
  const SettingsSemanticOverlayChanged({
    required this.showSemanticOverlay,
  });

  final bool showSemanticOverlay;

  @override
  List<Object> get props => <Object>[
        showSemanticOverlay,
      ];
}

final class SettingsExportPressed extends SettingsEvent {
  const SettingsExportPressed();
}

final class SettingsImportPressed extends SettingsEvent {
  const SettingsImportPressed();
}
