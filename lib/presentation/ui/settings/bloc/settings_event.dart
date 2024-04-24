part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => <Object>[];
}

class SettingsInitialized extends SettingsEvent {
  const SettingsInitialized();
}

class SettingsFailed extends SettingsEvent {
  const SettingsFailed({
    required this.message,
  });

  final String message;

  @override
  List<Object> get props => <Object>[
        message,
      ];
}

class SettingsChanged extends SettingsEvent {
  const SettingsChanged({
    required this.settings,
  });

  final Settings settings;

  @override
  List<Object> get props => <Object>[
        settings,
      ];
}

class SettingsDarkModeChanged extends SettingsEvent {
  const SettingsDarkModeChanged({
    required this.darkMode,
  });

  final bool darkMode;

  @override
  List<Object> get props => <Object>[
        darkMode,
      ];
}

class SettingsPrimaryColorChanged extends SettingsEvent {
  const SettingsPrimaryColorChanged({
    required this.color,
  });

  final int color;

  @override
  List<Object> get props => <Object>[
        color,
      ];
}

class SettingsSecondaryColorChanged extends SettingsEvent {
  const SettingsSecondaryColorChanged({
    required this.color,
  });

  final int color;

  @override
  List<Object> get props => <Object>[
        color,
      ];
}

class SettingsMaterialGridChanged extends SettingsEvent {
  const SettingsMaterialGridChanged({
    required this.showMaterialGrid,
  });

  final bool showMaterialGrid;

  @override
  List<Object> get props => <Object>[
        showMaterialGrid,
      ];
}

class SettingsPerformanceOverlayChanged extends SettingsEvent {
  const SettingsPerformanceOverlayChanged({
    required this.showPerformanceOverlay,
  });

  final bool showPerformanceOverlay;

  @override
  List<Object> get props => <Object>[
        showPerformanceOverlay,
      ];
}

class SettingsImmersiveModeChanged extends SettingsEvent {
  const SettingsImmersiveModeChanged({
    required this.immersiveMode,
  });

  final bool immersiveMode;

  @override
  List<Object> get props => <Object>[
        immersiveMode,
      ];
}

class SettingsSemanticOverlayChanged extends SettingsEvent {
  const SettingsSemanticOverlayChanged({
    required this.showSemanticOverlay,
  });

  final bool showSemanticOverlay;

  @override
  List<Object> get props => <Object>[
        showSemanticOverlay,
      ];
}

class SettingsExportPressed extends SettingsEvent {
  const SettingsExportPressed();
}

class SettingsImportPressed extends SettingsEvent {
  const SettingsImportPressed();
}
