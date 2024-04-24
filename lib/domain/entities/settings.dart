import 'package:equatable/equatable.dart';

class Settings extends Equatable {
  const Settings({
    int? id,
    bool? needsWelcome,
    bool? needsTutorial,
    bool? darkMode,
    int? primaryColor,
    int? secondaryColor,
    bool? showMaterialGrid,
    bool? showPerformanceOverlay,
    bool? showSemanticOverlay,
    bool? immersiveMode,
  })  : id = id ?? 0,
        needsWelcome = needsWelcome ?? true,
        needsTutorial = needsTutorial ?? true,
        darkMode = darkMode ?? false,
        primaryColor = primaryColor ?? 0xFF2196F3,
        secondaryColor = secondaryColor ?? 0xFFDE690C,
        showMaterialGrid = showMaterialGrid ?? false,
        showPerformanceOverlay = showPerformanceOverlay ?? false,
        showSemanticOverlay = showSemanticOverlay ?? false,
        immersiveMode = immersiveMode ?? false;

  final int id;
  final bool needsWelcome;
  final bool needsTutorial;
  final bool darkMode;
  final int primaryColor;
  final int secondaryColor;
  final bool showMaterialGrid;
  final bool showPerformanceOverlay;
  final bool showSemanticOverlay;
  final bool immersiveMode;

  @override
  List<Object> get props => <Object>[
        id,
        needsWelcome,
        needsTutorial,
        darkMode,
        primaryColor,
        secondaryColor,
        showMaterialGrid,
        showPerformanceOverlay,
        showSemanticOverlay,
        immersiveMode,
      ];

  @override
  String toString() {
    return 'Settings(id: $id)';
  }

  Settings copyWith({
    int? id,
    bool? needsWelcome,
    bool? needsTutorial,
    bool? darkMode,
    int? primaryColor,
    int? secondaryColor,
    bool? showMaterialGrid,
    bool? showPerformanceOverlay,
    bool? showSemanticOverlay,
    bool? immersiveMode,
  }) {
    return Settings(
      id: id ?? this.id,
      needsWelcome: needsWelcome ?? this.needsWelcome,
      needsTutorial: needsTutorial ?? this.needsTutorial,
      darkMode: darkMode ?? this.darkMode,
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      showMaterialGrid: showMaterialGrid ?? this.showMaterialGrid,
      showPerformanceOverlay:
          showPerformanceOverlay ?? this.showPerformanceOverlay,
      showSemanticOverlay: showSemanticOverlay ?? this.showSemanticOverlay,
      immersiveMode: immersiveMode ?? this.immersiveMode,
    );
  }
}
