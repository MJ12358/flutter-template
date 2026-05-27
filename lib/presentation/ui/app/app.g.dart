// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'app.dart';

class AppStatusMapper extends EnumMapper<AppStatus> {
  AppStatusMapper._();

  static AppStatusMapper? _instance;
  static AppStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AppStatusMapper._());
    }
    return _instance!;
  }

  static AppStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  AppStatus decode(dynamic value) {
    switch (value) {
      case r'initializing':
        return AppStatus.initializing;
      case r'needs_welcome':
        return AppStatus.needsWelcome;
      case r'success':
        return AppStatus.success;
      case r'failure':
        return AppStatus.failure;
      case r'reset':
        return AppStatus.reset;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(AppStatus self) {
    switch (self) {
      case AppStatus.initializing:
        return r'initializing';
      case AppStatus.needsWelcome:
        return r'needs_welcome';
      case AppStatus.success:
        return r'success';
      case AppStatus.failure:
        return r'failure';
      case AppStatus.reset:
        return r'reset';
    }
  }
}

extension AppStatusMapperExtension on AppStatus {
  String toValue() {
    AppStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<AppStatus>(this) as String;
  }
}

class AppStateMapper extends ClassMapperBase<AppState> {
  AppStateMapper._();

  static AppStateMapper? _instance;
  static AppStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AppStateMapper._());
      SettingsMapper.ensureInitialized();
      SharedPrefsMapper.ensureInitialized();
      AppStatusMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AppState';

  static Settings _$settings(AppState v) => v.settings;
  static const Field<AppState, Settings> _f$settings = Field(
    'settings',
    _$settings,
    opt: true,
    def: const Settings(),
  );
  static SharedPrefs _$sharedPrefs(AppState v) => v.sharedPrefs;
  static const Field<AppState, SharedPrefs> _f$sharedPrefs = Field(
    'sharedPrefs',
    _$sharedPrefs,
    key: r'shared_prefs',
    opt: true,
    def: const SharedPrefs(),
  );
  static AppStatus _$status(AppState v) => v.status;
  static const Field<AppState, AppStatus> _f$status = Field(
    'status',
    _$status,
    opt: true,
    def: AppStatus.initializing,
  );
  static String _$errorMessage(AppState v) => v.errorMessage;
  static const Field<AppState, String> _f$errorMessage = Field(
    'errorMessage',
    _$errorMessage,
    key: r'error_message',
    opt: true,
    def: '',
  );

  @override
  final MappableFields<AppState> fields = const {
    #settings: _f$settings,
    #sharedPrefs: _f$sharedPrefs,
    #status: _f$status,
    #errorMessage: _f$errorMessage,
  };

  static AppState _instantiate(DecodingData data) {
    return AppState(
      settings: data.dec(_f$settings),
      sharedPrefs: data.dec(_f$sharedPrefs),
      status: data.dec(_f$status),
      errorMessage: data.dec(_f$errorMessage),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static AppState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AppState>(map);
  }

  static AppState fromJson(String json) {
    return ensureInitialized().decodeJson<AppState>(json);
  }
}

mixin AppStateMappable {
  String toJson() {
    return AppStateMapper.ensureInitialized().encodeJson<AppState>(
      this as AppState,
    );
  }

  Map<String, dynamic> toMap() {
    return AppStateMapper.ensureInitialized().encodeMap<AppState>(
      this as AppState,
    );
  }

  AppStateCopyWith<AppState, AppState, AppState> get copyWith =>
      _AppStateCopyWithImpl<AppState, AppState>(
        this as AppState,
        $identity,
        $identity,
      );
  @override
  bool operator ==(Object other) {
    return AppStateMapper.ensureInitialized().equalsValue(
      this as AppState,
      other,
    );
  }

  @override
  int get hashCode {
    return AppStateMapper.ensureInitialized().hashValue(this as AppState);
  }
}

extension AppStateValueCopy<$R, $Out> on ObjectCopyWith<$R, AppState, $Out> {
  AppStateCopyWith<$R, AppState, $Out> get $asAppState =>
      $base.as((v, t, t2) => _AppStateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AppStateCopyWith<$R, $In extends AppState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  SettingsCopyWith<$R, Settings, Settings> get settings;
  SharedPrefsCopyWith<$R, SharedPrefs, SharedPrefs> get sharedPrefs;
  $R call({
    Settings? settings,
    SharedPrefs? sharedPrefs,
    AppStatus? status,
    String? errorMessage,
  });
  AppStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AppStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AppState, $Out>
    implements AppStateCopyWith<$R, AppState, $Out> {
  _AppStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AppState> $mapper =
      AppStateMapper.ensureInitialized();
  @override
  SettingsCopyWith<$R, Settings, Settings> get settings =>
      $value.settings.copyWith.$chain((v) => call(settings: v));
  @override
  SharedPrefsCopyWith<$R, SharedPrefs, SharedPrefs> get sharedPrefs =>
      $value.sharedPrefs.copyWith.$chain((v) => call(sharedPrefs: v));
  @override
  $R call({
    Settings? settings,
    SharedPrefs? sharedPrefs,
    AppStatus? status,
    String? errorMessage,
  }) => $apply(
    FieldCopyWithData({
      if (settings != null) #settings: settings,
      if (sharedPrefs != null) #sharedPrefs: sharedPrefs,
      if (status != null) #status: status,
      if (errorMessage != null) #errorMessage: errorMessage,
    }),
  );
  @override
  AppState $make(CopyWithData data) => AppState(
    settings: data.get(#settings, or: $value.settings),
    sharedPrefs: data.get(#sharedPrefs, or: $value.sharedPrefs),
    status: data.get(#status, or: $value.status),
    errorMessage: data.get(#errorMessage, or: $value.errorMessage),
  );

  @override
  AppStateCopyWith<$R2, AppState, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _AppStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

