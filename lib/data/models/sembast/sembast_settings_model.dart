import 'package:dart_extensionz/dart_extensionz.dart';
import 'package:flutter_template/domain/entities/settings.dart';
import 'package:sembast/sembast.dart';

class SembastSettingsModel extends Settings {
  const SembastSettingsModel({
    super.id,
    super.needsTutorial,
    super.darkMode,
    super.primaryColor,
    super.secondaryColor,
    super.immersiveMode,
    super.confirmExit,
  });

  static const String keyId = 'id';
  static const String keyNeedsTutorial = 'needs_tutorial';
  static const String keyDarkMode = 'dark_mode';
  static const String keyPrimaryColor = 'primary_color';
  static const String keySecondaryColor = 'secondary_color';
  static const String keyImmersiveMode = 'immersive_mode';
  static const String keyConfirmExit = 'confirm_exit';

  factory SembastSettingsModel.fromEntity(Settings settings) {
    return SembastSettingsModel(
      id: settings.id,
      needsTutorial: settings.needsTutorial,
      darkMode: settings.darkMode,
      primaryColor: settings.primaryColor,
      secondaryColor: settings.secondaryColor,
      immersiveMode: settings.immersiveMode,
      confirmExit: settings.confirmExit,
    );
  }

  factory SembastSettingsModel.fromMap(Map<String, Object?>? map) {
    return SembastSettingsModel(
      id: map.get<int>(keyId),
      needsTutorial: map.get<bool>(keyNeedsTutorial),
      darkMode: map.get<bool>(keyDarkMode),
      primaryColor: map.get<int>(keyPrimaryColor),
      secondaryColor: map.get<int>(keySecondaryColor),
      immersiveMode: map.get<bool>(keyImmersiveMode),
      confirmExit: map.get<bool>(keyConfirmExit),
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

  @override
  Map<String, Object?> toMap() {
    return <String, Object?>{
      keyId: id,
      keyNeedsTutorial: needsTutorial,
      keyDarkMode: darkMode,
      keyPrimaryColor: primaryColor,
      keySecondaryColor: secondaryColor,
      keyImmersiveMode: immersiveMode,
      keyConfirmExit: confirmExit,
    };
  }
}
