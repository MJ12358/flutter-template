import 'package:dart_mappable/dart_mappable.dart';

part 'shared_prefs.g.dart';

@MappableClass()
class SharedPrefs with SharedPrefsMappable {
  const SharedPrefs({
    AppPrefs? app,
    DebugPrefs? debug,
    NavigationPrefs? navigation,
  }) : app = app ?? const AppPrefs(),
       debug = debug ?? const DebugPrefs(),
       navigation = navigation ?? const NavigationPrefs();

  final AppPrefs app;
  final DebugPrefs debug;
  final NavigationPrefs navigation;

  static SharedPrefs fromJson(String json) => SharedPrefsMapper.fromJson(json);
}

@MappableClass()
class AppPrefs with AppPrefsMappable {
  const AppPrefs({
    bool? needsWelcome,
    bool? analyticsEnabled,
  }) : needsWelcome = needsWelcome ?? true,
       analyticsEnabled = analyticsEnabled ?? true;

  final bool needsWelcome;
  final bool analyticsEnabled;
}

@MappableClass()
class DebugPrefs with DebugPrefsMappable {
  const DebugPrefs({
    bool? invertOversizedImages,
    bool? logsEnabled,
    bool? paintSize,
    bool? paintLayerBorders,
    bool? paintBaselines,
    bool? paintPointers,
    bool? repaintRainbow,
    bool? repaintTextRainbow,
    bool? showMaterialGrid,
    bool? showPerformanceOverlay,
    bool? showSemanticOverlay,
    double? timeDilation,
  }) : invertOversizedImages = invertOversizedImages ?? false,
       logsEnabled = logsEnabled ?? false,
       paintSize = paintSize ?? false,
       paintLayerBorders = paintLayerBorders ?? false,
       paintBaselines = paintBaselines ?? false,
       paintPointers = paintPointers ?? false,
       repaintRainbow = repaintRainbow ?? false,
       repaintTextRainbow = repaintTextRainbow ?? false,
       showMaterialGrid = showMaterialGrid ?? false,
       showPerformanceOverlay = showPerformanceOverlay ?? false,
       showSemanticOverlay = showSemanticOverlay ?? false,
       timeDilation = timeDilation ?? 1.0;

  final bool invertOversizedImages;
  final bool logsEnabled;
  final bool paintSize;
  final bool paintLayerBorders;
  final bool paintBaselines;
  final bool paintPointers;
  final bool repaintRainbow;
  final bool repaintTextRainbow;
  final bool showMaterialGrid;
  final bool showPerformanceOverlay;
  final bool showSemanticOverlay;
  final double timeDilation;
}

@MappableClass()
class NavigationPrefs with NavigationPrefsMappable {
  const NavigationPrefs({
    int? index,
  }) : index = index ?? 0;

  final int index;
}
