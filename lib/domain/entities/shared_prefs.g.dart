// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'shared_prefs.dart';

class SharedPrefsMapper extends ClassMapperBase<SharedPrefs> {
  SharedPrefsMapper._();

  static SharedPrefsMapper? _instance;
  static SharedPrefsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SharedPrefsMapper._());
      AppPrefsMapper.ensureInitialized();
      DebugPrefsMapper.ensureInitialized();
      NavigationPrefsMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SharedPrefs';

  static AppPrefs _$app(SharedPrefs v) => v.app;
  static const Field<SharedPrefs, AppPrefs> _f$app = Field(
    'app',
    _$app,
    opt: true,
  );
  static DebugPrefs _$debug(SharedPrefs v) => v.debug;
  static const Field<SharedPrefs, DebugPrefs> _f$debug = Field(
    'debug',
    _$debug,
    opt: true,
  );
  static NavigationPrefs _$navigation(SharedPrefs v) => v.navigation;
  static const Field<SharedPrefs, NavigationPrefs> _f$navigation = Field(
    'navigation',
    _$navigation,
    opt: true,
  );

  @override
  final MappableFields<SharedPrefs> fields = const {
    #app: _f$app,
    #debug: _f$debug,
    #navigation: _f$navigation,
  };

  static SharedPrefs _instantiate(DecodingData data) {
    return SharedPrefs(
      app: data.dec(_f$app),
      debug: data.dec(_f$debug),
      navigation: data.dec(_f$navigation),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static SharedPrefs fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SharedPrefs>(map);
  }

  static SharedPrefs fromJson(String json) {
    return ensureInitialized().decodeJson<SharedPrefs>(json);
  }
}

mixin SharedPrefsMappable {
  String toJson() {
    return SharedPrefsMapper.ensureInitialized().encodeJson<SharedPrefs>(
      this as SharedPrefs,
    );
  }

  Map<String, dynamic> toMap() {
    return SharedPrefsMapper.ensureInitialized().encodeMap<SharedPrefs>(
      this as SharedPrefs,
    );
  }

  SharedPrefsCopyWith<SharedPrefs, SharedPrefs, SharedPrefs> get copyWith =>
      _SharedPrefsCopyWithImpl<SharedPrefs, SharedPrefs>(
        this as SharedPrefs,
        $identity,
        $identity,
      );
  @override
  bool operator ==(Object other) {
    return SharedPrefsMapper.ensureInitialized().equalsValue(
      this as SharedPrefs,
      other,
    );
  }

  @override
  int get hashCode {
    return SharedPrefsMapper.ensureInitialized().hashValue(this as SharedPrefs);
  }
}

extension SharedPrefsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SharedPrefs, $Out> {
  SharedPrefsCopyWith<$R, SharedPrefs, $Out> get $asSharedPrefs =>
      $base.as((v, t, t2) => _SharedPrefsCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SharedPrefsCopyWith<$R, $In extends SharedPrefs, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  AppPrefsCopyWith<$R, AppPrefs, AppPrefs> get app;
  DebugPrefsCopyWith<$R, DebugPrefs, DebugPrefs> get debug;
  NavigationPrefsCopyWith<$R, NavigationPrefs, NavigationPrefs> get navigation;
  $R call({AppPrefs? app, DebugPrefs? debug, NavigationPrefs? navigation});
  SharedPrefsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SharedPrefsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SharedPrefs, $Out>
    implements SharedPrefsCopyWith<$R, SharedPrefs, $Out> {
  _SharedPrefsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SharedPrefs> $mapper =
      SharedPrefsMapper.ensureInitialized();
  @override
  AppPrefsCopyWith<$R, AppPrefs, AppPrefs> get app =>
      ($value.app as AppPrefs).copyWith.$chain((v) => call(app: v));
  @override
  DebugPrefsCopyWith<$R, DebugPrefs, DebugPrefs> get debug =>
      ($value.debug as DebugPrefs).copyWith.$chain((v) => call(debug: v));
  @override
  NavigationPrefsCopyWith<$R, NavigationPrefs, NavigationPrefs>
  get navigation => ($value.navigation as NavigationPrefs).copyWith.$chain(
    (v) => call(navigation: v),
  );
  @override
  $R call({
    Object? app = $none,
    Object? debug = $none,
    Object? navigation = $none,
  }) => $apply(
    FieldCopyWithData({
      if (app != $none) #app: app,
      if (debug != $none) #debug: debug,
      if (navigation != $none) #navigation: navigation,
    }),
  );
  @override
  SharedPrefs $make(CopyWithData data) => SharedPrefs(
    app: data.get(#app, or: $value.app),
    debug: data.get(#debug, or: $value.debug),
    navigation: data.get(#navigation, or: $value.navigation),
  );

  @override
  SharedPrefsCopyWith<$R2, SharedPrefs, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _SharedPrefsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class AppPrefsMapper extends ClassMapperBase<AppPrefs> {
  AppPrefsMapper._();

  static AppPrefsMapper? _instance;
  static AppPrefsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AppPrefsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'AppPrefs';

  static bool _$needsWelcome(AppPrefs v) => v.needsWelcome;
  static const Field<AppPrefs, bool> _f$needsWelcome = Field(
    'needsWelcome',
    _$needsWelcome,
    key: r'needs_welcome',
    opt: true,
  );
  static bool _$analyticsEnabled(AppPrefs v) => v.analyticsEnabled;
  static const Field<AppPrefs, bool> _f$analyticsEnabled = Field(
    'analyticsEnabled',
    _$analyticsEnabled,
    key: r'analytics_enabled',
    opt: true,
  );

  @override
  final MappableFields<AppPrefs> fields = const {
    #needsWelcome: _f$needsWelcome,
    #analyticsEnabled: _f$analyticsEnabled,
  };

  static AppPrefs _instantiate(DecodingData data) {
    return AppPrefs(
      needsWelcome: data.dec(_f$needsWelcome),
      analyticsEnabled: data.dec(_f$analyticsEnabled),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static AppPrefs fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AppPrefs>(map);
  }

  static AppPrefs fromJson(String json) {
    return ensureInitialized().decodeJson<AppPrefs>(json);
  }
}

mixin AppPrefsMappable {
  String toJson() {
    return AppPrefsMapper.ensureInitialized().encodeJson<AppPrefs>(
      this as AppPrefs,
    );
  }

  Map<String, dynamic> toMap() {
    return AppPrefsMapper.ensureInitialized().encodeMap<AppPrefs>(
      this as AppPrefs,
    );
  }

  AppPrefsCopyWith<AppPrefs, AppPrefs, AppPrefs> get copyWith =>
      _AppPrefsCopyWithImpl<AppPrefs, AppPrefs>(
        this as AppPrefs,
        $identity,
        $identity,
      );
  @override
  bool operator ==(Object other) {
    return AppPrefsMapper.ensureInitialized().equalsValue(
      this as AppPrefs,
      other,
    );
  }

  @override
  int get hashCode {
    return AppPrefsMapper.ensureInitialized().hashValue(this as AppPrefs);
  }
}

extension AppPrefsValueCopy<$R, $Out> on ObjectCopyWith<$R, AppPrefs, $Out> {
  AppPrefsCopyWith<$R, AppPrefs, $Out> get $asAppPrefs =>
      $base.as((v, t, t2) => _AppPrefsCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AppPrefsCopyWith<$R, $In extends AppPrefs, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({bool? needsWelcome, bool? analyticsEnabled});
  AppPrefsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AppPrefsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AppPrefs, $Out>
    implements AppPrefsCopyWith<$R, AppPrefs, $Out> {
  _AppPrefsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AppPrefs> $mapper =
      AppPrefsMapper.ensureInitialized();
  @override
  $R call({Object? needsWelcome = $none, Object? analyticsEnabled = $none}) =>
      $apply(
        FieldCopyWithData({
          if (needsWelcome != $none) #needsWelcome: needsWelcome,
          if (analyticsEnabled != $none) #analyticsEnabled: analyticsEnabled,
        }),
      );
  @override
  AppPrefs $make(CopyWithData data) => AppPrefs(
    needsWelcome: data.get(#needsWelcome, or: $value.needsWelcome),
    analyticsEnabled: data.get(#analyticsEnabled, or: $value.analyticsEnabled),
  );

  @override
  AppPrefsCopyWith<$R2, AppPrefs, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _AppPrefsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class DebugPrefsMapper extends ClassMapperBase<DebugPrefs> {
  DebugPrefsMapper._();

  static DebugPrefsMapper? _instance;
  static DebugPrefsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DebugPrefsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'DebugPrefs';

  static bool _$invertOversizedImages(DebugPrefs v) => v.invertOversizedImages;
  static const Field<DebugPrefs, bool> _f$invertOversizedImages = Field(
    'invertOversizedImages',
    _$invertOversizedImages,
    key: r'invert_oversized_images',
    opt: true,
  );
  static bool _$logsEnabled(DebugPrefs v) => v.logsEnabled;
  static const Field<DebugPrefs, bool> _f$logsEnabled = Field(
    'logsEnabled',
    _$logsEnabled,
    key: r'logs_enabled',
    opt: true,
  );
  static bool _$paintSize(DebugPrefs v) => v.paintSize;
  static const Field<DebugPrefs, bool> _f$paintSize = Field(
    'paintSize',
    _$paintSize,
    key: r'paint_size',
    opt: true,
  );
  static bool _$paintLayerBorders(DebugPrefs v) => v.paintLayerBorders;
  static const Field<DebugPrefs, bool> _f$paintLayerBorders = Field(
    'paintLayerBorders',
    _$paintLayerBorders,
    key: r'paint_layer_borders',
    opt: true,
  );
  static bool _$paintBaselines(DebugPrefs v) => v.paintBaselines;
  static const Field<DebugPrefs, bool> _f$paintBaselines = Field(
    'paintBaselines',
    _$paintBaselines,
    key: r'paint_baselines',
    opt: true,
  );
  static bool _$paintPointers(DebugPrefs v) => v.paintPointers;
  static const Field<DebugPrefs, bool> _f$paintPointers = Field(
    'paintPointers',
    _$paintPointers,
    key: r'paint_pointers',
    opt: true,
  );
  static bool _$repaintRainbow(DebugPrefs v) => v.repaintRainbow;
  static const Field<DebugPrefs, bool> _f$repaintRainbow = Field(
    'repaintRainbow',
    _$repaintRainbow,
    key: r'repaint_rainbow',
    opt: true,
  );
  static bool _$repaintTextRainbow(DebugPrefs v) => v.repaintTextRainbow;
  static const Field<DebugPrefs, bool> _f$repaintTextRainbow = Field(
    'repaintTextRainbow',
    _$repaintTextRainbow,
    key: r'repaint_text_rainbow',
    opt: true,
  );
  static bool _$showMaterialGrid(DebugPrefs v) => v.showMaterialGrid;
  static const Field<DebugPrefs, bool> _f$showMaterialGrid = Field(
    'showMaterialGrid',
    _$showMaterialGrid,
    key: r'show_material_grid',
    opt: true,
  );
  static bool _$showPerformanceOverlay(DebugPrefs v) =>
      v.showPerformanceOverlay;
  static const Field<DebugPrefs, bool> _f$showPerformanceOverlay = Field(
    'showPerformanceOverlay',
    _$showPerformanceOverlay,
    key: r'show_performance_overlay',
    opt: true,
  );
  static bool _$showSemanticOverlay(DebugPrefs v) => v.showSemanticOverlay;
  static const Field<DebugPrefs, bool> _f$showSemanticOverlay = Field(
    'showSemanticOverlay',
    _$showSemanticOverlay,
    key: r'show_semantic_overlay',
    opt: true,
  );
  static double _$timeDilation(DebugPrefs v) => v.timeDilation;
  static const Field<DebugPrefs, double> _f$timeDilation = Field(
    'timeDilation',
    _$timeDilation,
    key: r'time_dilation',
    opt: true,
  );

  @override
  final MappableFields<DebugPrefs> fields = const {
    #invertOversizedImages: _f$invertOversizedImages,
    #logsEnabled: _f$logsEnabled,
    #paintSize: _f$paintSize,
    #paintLayerBorders: _f$paintLayerBorders,
    #paintBaselines: _f$paintBaselines,
    #paintPointers: _f$paintPointers,
    #repaintRainbow: _f$repaintRainbow,
    #repaintTextRainbow: _f$repaintTextRainbow,
    #showMaterialGrid: _f$showMaterialGrid,
    #showPerformanceOverlay: _f$showPerformanceOverlay,
    #showSemanticOverlay: _f$showSemanticOverlay,
    #timeDilation: _f$timeDilation,
  };

  static DebugPrefs _instantiate(DecodingData data) {
    return DebugPrefs(
      invertOversizedImages: data.dec(_f$invertOversizedImages),
      logsEnabled: data.dec(_f$logsEnabled),
      paintSize: data.dec(_f$paintSize),
      paintLayerBorders: data.dec(_f$paintLayerBorders),
      paintBaselines: data.dec(_f$paintBaselines),
      paintPointers: data.dec(_f$paintPointers),
      repaintRainbow: data.dec(_f$repaintRainbow),
      repaintTextRainbow: data.dec(_f$repaintTextRainbow),
      showMaterialGrid: data.dec(_f$showMaterialGrid),
      showPerformanceOverlay: data.dec(_f$showPerformanceOverlay),
      showSemanticOverlay: data.dec(_f$showSemanticOverlay),
      timeDilation: data.dec(_f$timeDilation),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static DebugPrefs fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DebugPrefs>(map);
  }

  static DebugPrefs fromJson(String json) {
    return ensureInitialized().decodeJson<DebugPrefs>(json);
  }
}

mixin DebugPrefsMappable {
  String toJson() {
    return DebugPrefsMapper.ensureInitialized().encodeJson<DebugPrefs>(
      this as DebugPrefs,
    );
  }

  Map<String, dynamic> toMap() {
    return DebugPrefsMapper.ensureInitialized().encodeMap<DebugPrefs>(
      this as DebugPrefs,
    );
  }

  DebugPrefsCopyWith<DebugPrefs, DebugPrefs, DebugPrefs> get copyWith =>
      _DebugPrefsCopyWithImpl<DebugPrefs, DebugPrefs>(
        this as DebugPrefs,
        $identity,
        $identity,
      );
  @override
  bool operator ==(Object other) {
    return DebugPrefsMapper.ensureInitialized().equalsValue(
      this as DebugPrefs,
      other,
    );
  }

  @override
  int get hashCode {
    return DebugPrefsMapper.ensureInitialized().hashValue(this as DebugPrefs);
  }
}

extension DebugPrefsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, DebugPrefs, $Out> {
  DebugPrefsCopyWith<$R, DebugPrefs, $Out> get $asDebugPrefs =>
      $base.as((v, t, t2) => _DebugPrefsCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class DebugPrefsCopyWith<$R, $In extends DebugPrefs, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
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
  });
  DebugPrefsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _DebugPrefsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DebugPrefs, $Out>
    implements DebugPrefsCopyWith<$R, DebugPrefs, $Out> {
  _DebugPrefsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DebugPrefs> $mapper =
      DebugPrefsMapper.ensureInitialized();
  @override
  $R call({
    Object? invertOversizedImages = $none,
    Object? logsEnabled = $none,
    Object? paintSize = $none,
    Object? paintLayerBorders = $none,
    Object? paintBaselines = $none,
    Object? paintPointers = $none,
    Object? repaintRainbow = $none,
    Object? repaintTextRainbow = $none,
    Object? showMaterialGrid = $none,
    Object? showPerformanceOverlay = $none,
    Object? showSemanticOverlay = $none,
    Object? timeDilation = $none,
  }) => $apply(
    FieldCopyWithData({
      if (invertOversizedImages != $none)
        #invertOversizedImages: invertOversizedImages,
      if (logsEnabled != $none) #logsEnabled: logsEnabled,
      if (paintSize != $none) #paintSize: paintSize,
      if (paintLayerBorders != $none) #paintLayerBorders: paintLayerBorders,
      if (paintBaselines != $none) #paintBaselines: paintBaselines,
      if (paintPointers != $none) #paintPointers: paintPointers,
      if (repaintRainbow != $none) #repaintRainbow: repaintRainbow,
      if (repaintTextRainbow != $none) #repaintTextRainbow: repaintTextRainbow,
      if (showMaterialGrid != $none) #showMaterialGrid: showMaterialGrid,
      if (showPerformanceOverlay != $none)
        #showPerformanceOverlay: showPerformanceOverlay,
      if (showSemanticOverlay != $none)
        #showSemanticOverlay: showSemanticOverlay,
      if (timeDilation != $none) #timeDilation: timeDilation,
    }),
  );
  @override
  DebugPrefs $make(CopyWithData data) => DebugPrefs(
    invertOversizedImages: data.get(
      #invertOversizedImages,
      or: $value.invertOversizedImages,
    ),
    logsEnabled: data.get(#logsEnabled, or: $value.logsEnabled),
    paintSize: data.get(#paintSize, or: $value.paintSize),
    paintLayerBorders: data.get(
      #paintLayerBorders,
      or: $value.paintLayerBorders,
    ),
    paintBaselines: data.get(#paintBaselines, or: $value.paintBaselines),
    paintPointers: data.get(#paintPointers, or: $value.paintPointers),
    repaintRainbow: data.get(#repaintRainbow, or: $value.repaintRainbow),
    repaintTextRainbow: data.get(
      #repaintTextRainbow,
      or: $value.repaintTextRainbow,
    ),
    showMaterialGrid: data.get(#showMaterialGrid, or: $value.showMaterialGrid),
    showPerformanceOverlay: data.get(
      #showPerformanceOverlay,
      or: $value.showPerformanceOverlay,
    ),
    showSemanticOverlay: data.get(
      #showSemanticOverlay,
      or: $value.showSemanticOverlay,
    ),
    timeDilation: data.get(#timeDilation, or: $value.timeDilation),
  );

  @override
  DebugPrefsCopyWith<$R2, DebugPrefs, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _DebugPrefsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class NavigationPrefsMapper extends ClassMapperBase<NavigationPrefs> {
  NavigationPrefsMapper._();

  static NavigationPrefsMapper? _instance;
  static NavigationPrefsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = NavigationPrefsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'NavigationPrefs';

  static int _$index(NavigationPrefs v) => v.index;
  static const Field<NavigationPrefs, int> _f$index = Field(
    'index',
    _$index,
    opt: true,
  );

  @override
  final MappableFields<NavigationPrefs> fields = const {#index: _f$index};

  static NavigationPrefs _instantiate(DecodingData data) {
    return NavigationPrefs(index: data.dec(_f$index));
  }

  @override
  final Function instantiate = _instantiate;

  static NavigationPrefs fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<NavigationPrefs>(map);
  }

  static NavigationPrefs fromJson(String json) {
    return ensureInitialized().decodeJson<NavigationPrefs>(json);
  }
}

mixin NavigationPrefsMappable {
  String toJson() {
    return NavigationPrefsMapper.ensureInitialized()
        .encodeJson<NavigationPrefs>(this as NavigationPrefs);
  }

  Map<String, dynamic> toMap() {
    return NavigationPrefsMapper.ensureInitialized().encodeMap<NavigationPrefs>(
      this as NavigationPrefs,
    );
  }

  NavigationPrefsCopyWith<NavigationPrefs, NavigationPrefs, NavigationPrefs>
  get copyWith =>
      _NavigationPrefsCopyWithImpl<NavigationPrefs, NavigationPrefs>(
        this as NavigationPrefs,
        $identity,
        $identity,
      );
  @override
  bool operator ==(Object other) {
    return NavigationPrefsMapper.ensureInitialized().equalsValue(
      this as NavigationPrefs,
      other,
    );
  }

  @override
  int get hashCode {
    return NavigationPrefsMapper.ensureInitialized().hashValue(
      this as NavigationPrefs,
    );
  }
}

extension NavigationPrefsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, NavigationPrefs, $Out> {
  NavigationPrefsCopyWith<$R, NavigationPrefs, $Out> get $asNavigationPrefs =>
      $base.as((v, t, t2) => _NavigationPrefsCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class NavigationPrefsCopyWith<$R, $In extends NavigationPrefs, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? index});
  NavigationPrefsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _NavigationPrefsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, NavigationPrefs, $Out>
    implements NavigationPrefsCopyWith<$R, NavigationPrefs, $Out> {
  _NavigationPrefsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<NavigationPrefs> $mapper =
      NavigationPrefsMapper.ensureInitialized();
  @override
  $R call({Object? index = $none}) =>
      $apply(FieldCopyWithData({if (index != $none) #index: index}));
  @override
  NavigationPrefs $make(CopyWithData data) =>
      NavigationPrefs(index: data.get(#index, or: $value.index));

  @override
  NavigationPrefsCopyWith<$R2, NavigationPrefs, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _NavigationPrefsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

