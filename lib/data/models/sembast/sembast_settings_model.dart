import 'package:flutter_template/domain/entities/settings.dart';
import 'package:sembast/sembast.dart';

class SembastSettingsModel extends Settings {
  SembastSettingsModel({
    int? id,
    super.needsWelcome,
    super.needsTutorial,
    super.darkMode,
    super.primaryColor,
    super.secondaryColor,
  }) : super(
          id: id?.toString(),
        );

  static const String keyId = 'id';
  static const String keyNeedsWelcome = 'needs_welcome';
  static const String keyNeedsTutorial = 'needs_tutorial';
  static const String keyDarkMode = 'dark_mode';
  static const String keyPrimaryColor = 'primary_color';
  static const String keySecondaryColor = 'secondary_color';

  factory SembastSettingsModel.fromEntity(Settings settings) {
    return SembastSettingsModel(
      id: int.tryParse(settings.id),
      needsWelcome: settings.needsWelcome,
      needsTutorial: settings.needsTutorial,
      darkMode: settings.darkMode,
      primaryColor: settings.primaryColor,
      secondaryColor: settings.secondaryColor,
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
    };
  }
}
