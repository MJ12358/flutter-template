import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter_template/core/constants.dart';

part 'settings.g.dart';

@MappableClass()
class Settings with SettingsMappable {
  const Settings({
    int? id,
    bool? needsTutorial,
    bool? darkMode,
    int? primaryColor,
    int? secondaryColor,
    bool? immersiveMode,
    bool? confirmExit,
  }) : id = id ?? 0,
       needsTutorial = needsTutorial ?? true,
       darkMode = darkMode ?? false,
       primaryColor = primaryColor ?? Style.primaryColor,
       secondaryColor = secondaryColor ?? Style.secondaryColor,
       immersiveMode = immersiveMode ?? false,
       confirmExit = confirmExit ?? false;

  final int id;
  final bool needsTutorial;
  final bool darkMode;
  final int primaryColor;
  final int secondaryColor;
  final bool immersiveMode;
  final bool confirmExit;

  @override
  String toString() {
    return 'Settings(id: $id)';
  }
}
