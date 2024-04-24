import 'package:flutter_template/domain/entities/settings.dart';
import 'package:sembast/sembast.dart';

class SembastSettingsModel extends Settings {
  const SembastSettingsModel({
    super.id,
    super.needsWelcome,
    super.needsTutorial,
    super.darkMode,
    super.primaryColor,
    super.secondaryColor,
    super.showMaterialGrid,
    super.showPerformanceOverlay,
    super.showSemanticOverlay,
    super.immersiveMode,
  });

  static const String keyId = 'id';
  static const String keyNeedsWelcome = 'needs_welcome';
  static const String keyNeedsTutorial = 'needs_tutorial';
  static const String keyDarkMode = 'dark_mode';
  static const String keyPrimaryColor = 'primary_color';
  static const String keySecondaryColor = 'secondary_color';
  static const String keyShowMaterialGrid = 'show_material_grid';
  static const String keyShowPerformanceOverlay = 'show_performance_overlay';
  static const String keyShowSemanticOverlay = 'show_semantic_overlay';
  static const String keyImmersiveMode = 'immersive_mode';

  factory SembastSettingsModel.fromEntity(Settings settings) {
    return SembastSettingsModel(
      id: settings.id,
      needsWelcome: settings.needsWelcome,
      needsTutorial: settings.needsTutorial,
      darkMode: settings.darkMode,
      primaryColor: settings.primaryColor,
      secondaryColor: settings.secondaryColor,
      showMaterialGrid: settings.showMaterialGrid,
      showPerformanceOverlay: settings.showPerformanceOverlay,
      showSemanticOverlay: settings.showSemanticOverlay,
      immersiveMode: settings.immersiveMode,
    );
  }

  factory SembastSettingsModel.fromMap(Map<String, Object?>? map) {
    return SembastSettingsModel(
      id: map?[keyId] as int?,
      needsWelcome: map?[keyNeedsWelcome] as bool?,
      needsTutorial: map?[keyNeedsTutorial] as bool?,
      darkMode: map?[keyDarkMode] as bool?,
      primaryColor: map?[keyPrimaryColor] as int?,
      secondaryColor: map?[keySecondaryColor] as int?,
      showMaterialGrid: map?[keyShowMaterialGrid] as bool?,
      showPerformanceOverlay: map?[keyShowPerformanceOverlay] as bool?,
      showSemanticOverlay: map?[keyShowSemanticOverlay] as bool?,
      immersiveMode: map?[keyImmersiveMode] as bool?,
    );
  }

  factory SembastSettingsModel.fromRecord(
    RecordSnapshot<int, Map<String, Object?>>? record,
  ) {
    Map<String, Object?> map = <String, Object?>{};
    if (record != null) {
      map = Map<String, Object?>.of(record.value);
    }
    map[keyId] = record?.key;
    return SembastSettingsModel.fromMap(map);
  }

  Map<String, Object?> toMap() {
    return <String, Object?>{
      keyId: id,
      keyNeedsWelcome: needsWelcome,
      keyNeedsTutorial: needsTutorial,
      keyDarkMode: darkMode,
      keyPrimaryColor: primaryColor,
      keySecondaryColor: secondaryColor,
      keyShowMaterialGrid: showMaterialGrid,
      keyShowPerformanceOverlay: showPerformanceOverlay,
      keyShowSemanticOverlay: showSemanticOverlay,
      keyImmersiveMode: immersiveMode,
    };
  }
}
