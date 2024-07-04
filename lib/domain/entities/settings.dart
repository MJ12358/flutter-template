import 'package:equatable/equatable.dart';
import 'package:flutter_template/core/constants.dart';

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
    bool? analytics,
  })  : id = id ?? 0,
        needsWelcome = needsWelcome ?? true,
        needsTutorial = needsTutorial ?? true,
        darkMode = darkMode ?? false,
        primaryColor = primaryColor ?? Style.primaryColor,
        secondaryColor = secondaryColor ?? Style.secondaryColor,
        showMaterialGrid = showMaterialGrid ?? false,
        showPerformanceOverlay = showPerformanceOverlay ?? false,
        showSemanticOverlay = showSemanticOverlay ?? false,
        immersiveMode = immersiveMode ?? false,
        analytics = analytics ?? true;

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
  final bool analytics;

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
        analytics,
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
    bool? analytics,
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
      analytics: analytics ?? this.analytics,
    );
  }
}
