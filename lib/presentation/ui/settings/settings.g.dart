// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'settings.dart';

class SettingsStatusMapper extends EnumMapper<SettingsStatus> {
  SettingsStatusMapper._();

  static SettingsStatusMapper? _instance;
  static SettingsStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SettingsStatusMapper._());
    }
    return _instance!;
  }

  static SettingsStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  SettingsStatus decode(dynamic value) {
    switch (value) {
      case r'loading':
        return SettingsStatus.loading;
      case r'initial':
        return SettingsStatus.initial;
      case r'success':
        return SettingsStatus.success;
      case r'failure':
        return SettingsStatus.failure;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(SettingsStatus self) {
    switch (self) {
      case SettingsStatus.loading:
        return r'loading';
      case SettingsStatus.initial:
        return r'initial';
      case SettingsStatus.success:
        return r'success';
      case SettingsStatus.failure:
        return r'failure';
    }
  }
}

extension SettingsStatusMapperExtension on SettingsStatus {
  String toValue() {
    SettingsStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<SettingsStatus>(this) as String;
  }
}

class SettingsStateMapper extends ClassMapperBase<SettingsState> {
  SettingsStateMapper._();

  static SettingsStateMapper? _instance;
  static SettingsStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SettingsStateMapper._());
      SettingsMapper.ensureInitialized();
      SharedPrefsMapper.ensureInitialized();
      SettingsStatusMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SettingsState';

  static Settings _$settings(SettingsState v) => v.settings;
  static const Field<SettingsState, Settings> _f$settings = Field(
    'settings',
    _$settings,
    opt: true,
    def: const Settings(),
  );
  static SharedPrefs _$sharedPrefs(SettingsState v) => v.sharedPrefs;
  static const Field<SettingsState, SharedPrefs> _f$sharedPrefs = Field(
    'sharedPrefs',
    _$sharedPrefs,
    key: r'shared_prefs',
    opt: true,
    def: const SharedPrefs(),
  );
  static SettingsStatus _$status(SettingsState v) => v.status;
  static const Field<SettingsState, SettingsStatus> _f$status = Field(
    'status',
    _$status,
    opt: true,
    def: SettingsStatus.loading,
  );
  static String _$errorMessage(SettingsState v) => v.errorMessage;
  static const Field<SettingsState, String> _f$errorMessage = Field(
    'errorMessage',
    _$errorMessage,
    key: r'error_message',
    opt: true,
    def: '',
  );

  @override
  final MappableFields<SettingsState> fields = const {
    #settings: _f$settings,
    #sharedPrefs: _f$sharedPrefs,
    #status: _f$status,
    #errorMessage: _f$errorMessage,
  };

  static SettingsState _instantiate(DecodingData data) {
    return SettingsState(
      settings: data.dec(_f$settings),
      sharedPrefs: data.dec(_f$sharedPrefs),
      status: data.dec(_f$status),
      errorMessage: data.dec(_f$errorMessage),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static SettingsState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SettingsState>(map);
  }

  static SettingsState fromJson(String json) {
    return ensureInitialized().decodeJson<SettingsState>(json);
  }
}

mixin SettingsStateMappable {
  String toJson() {
    return SettingsStateMapper.ensureInitialized().encodeJson<SettingsState>(
      this as SettingsState,
    );
  }

  Map<String, dynamic> toMap() {
    return SettingsStateMapper.ensureInitialized().encodeMap<SettingsState>(
      this as SettingsState,
    );
  }

  SettingsStateCopyWith<SettingsState, SettingsState, SettingsState>
  get copyWith => _SettingsStateCopyWithImpl<SettingsState, SettingsState>(
    this as SettingsState,
    $identity,
    $identity,
  );
  @override
  bool operator ==(Object other) {
    return SettingsStateMapper.ensureInitialized().equalsValue(
      this as SettingsState,
      other,
    );
  }

  @override
  int get hashCode {
    return SettingsStateMapper.ensureInitialized().hashValue(
      this as SettingsState,
    );
  }
}

extension SettingsStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SettingsState, $Out> {
  SettingsStateCopyWith<$R, SettingsState, $Out> get $asSettingsState =>
      $base.as((v, t, t2) => _SettingsStateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SettingsStateCopyWith<$R, $In extends SettingsState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  SettingsCopyWith<$R, Settings, Settings> get settings;
  SharedPrefsCopyWith<$R, SharedPrefs, SharedPrefs> get sharedPrefs;
  $R call({
    Settings? settings,
    SharedPrefs? sharedPrefs,
    SettingsStatus? status,
    String? errorMessage,
  });
  SettingsStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SettingsStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SettingsState, $Out>
    implements SettingsStateCopyWith<$R, SettingsState, $Out> {
  _SettingsStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SettingsState> $mapper =
      SettingsStateMapper.ensureInitialized();
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
    SettingsStatus? status,
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
  SettingsState $make(CopyWithData data) => SettingsState(
    settings: data.get(#settings, or: $value.settings),
    sharedPrefs: data.get(#sharedPrefs, or: $value.sharedPrefs),
    status: data.get(#status, or: $value.status),
    errorMessage: data.get(#errorMessage, or: $value.errorMessage),
  );

  @override
  SettingsStateCopyWith<$R2, SettingsState, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _SettingsStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

