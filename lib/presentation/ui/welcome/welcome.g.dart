// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'welcome.dart';

class WelcomeStatusMapper extends EnumMapper<WelcomeStatus> {
  WelcomeStatusMapper._();

  static WelcomeStatusMapper? _instance;
  static WelcomeStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WelcomeStatusMapper._());
    }
    return _instance!;
  }

  static WelcomeStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  WelcomeStatus decode(dynamic value) {
    switch (value) {
      case r'initial':
        return WelcomeStatus.initial;
      case r'loading':
        return WelcomeStatus.loading;
      case r'failure':
        return WelcomeStatus.failure;
      case r'complete':
        return WelcomeStatus.complete;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(WelcomeStatus self) {
    switch (self) {
      case WelcomeStatus.initial:
        return r'initial';
      case WelcomeStatus.loading:
        return r'loading';
      case WelcomeStatus.failure:
        return r'failure';
      case WelcomeStatus.complete:
        return r'complete';
    }
  }
}

extension WelcomeStatusMapperExtension on WelcomeStatus {
  String toValue() {
    WelcomeStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<WelcomeStatus>(this) as String;
  }
}

class WelcomeStateMapper extends ClassMapperBase<WelcomeState> {
  WelcomeStateMapper._();

  static WelcomeStateMapper? _instance;
  static WelcomeStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WelcomeStateMapper._());
      SharedPrefsMapper.ensureInitialized();
      WelcomeStatusMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'WelcomeState';

  static SharedPrefs _$sharedPrefs(WelcomeState v) => v.sharedPrefs;
  static const Field<WelcomeState, SharedPrefs> _f$sharedPrefs = Field(
    'sharedPrefs',
    _$sharedPrefs,
    key: r'shared_prefs',
    opt: true,
    def: const SharedPrefs(),
  );
  static WelcomeStatus _$status(WelcomeState v) => v.status;
  static const Field<WelcomeState, WelcomeStatus> _f$status = Field(
    'status',
    _$status,
    opt: true,
    def: WelcomeStatus.loading,
  );
  static String _$errorMessage(WelcomeState v) => v.errorMessage;
  static const Field<WelcomeState, String> _f$errorMessage = Field(
    'errorMessage',
    _$errorMessage,
    key: r'error_message',
    opt: true,
    def: '',
  );

  @override
  final MappableFields<WelcomeState> fields = const {
    #sharedPrefs: _f$sharedPrefs,
    #status: _f$status,
    #errorMessage: _f$errorMessage,
  };

  static WelcomeState _instantiate(DecodingData data) {
    return WelcomeState(
      sharedPrefs: data.dec(_f$sharedPrefs),
      status: data.dec(_f$status),
      errorMessage: data.dec(_f$errorMessage),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static WelcomeState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<WelcomeState>(map);
  }

  static WelcomeState fromJson(String json) {
    return ensureInitialized().decodeJson<WelcomeState>(json);
  }
}

mixin WelcomeStateMappable {
  String toJson() {
    return WelcomeStateMapper.ensureInitialized().encodeJson<WelcomeState>(
      this as WelcomeState,
    );
  }

  Map<String, dynamic> toMap() {
    return WelcomeStateMapper.ensureInitialized().encodeMap<WelcomeState>(
      this as WelcomeState,
    );
  }

  WelcomeStateCopyWith<WelcomeState, WelcomeState, WelcomeState> get copyWith =>
      _WelcomeStateCopyWithImpl<WelcomeState, WelcomeState>(
        this as WelcomeState,
        $identity,
        $identity,
      );
  @override
  bool operator ==(Object other) {
    return WelcomeStateMapper.ensureInitialized().equalsValue(
      this as WelcomeState,
      other,
    );
  }

  @override
  int get hashCode {
    return WelcomeStateMapper.ensureInitialized().hashValue(
      this as WelcomeState,
    );
  }
}

extension WelcomeStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, WelcomeState, $Out> {
  WelcomeStateCopyWith<$R, WelcomeState, $Out> get $asWelcomeState =>
      $base.as((v, t, t2) => _WelcomeStateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class WelcomeStateCopyWith<$R, $In extends WelcomeState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  SharedPrefsCopyWith<$R, SharedPrefs, SharedPrefs> get sharedPrefs;
  $R call({
    SharedPrefs? sharedPrefs,
    WelcomeStatus? status,
    String? errorMessage,
  });
  WelcomeStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _WelcomeStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, WelcomeState, $Out>
    implements WelcomeStateCopyWith<$R, WelcomeState, $Out> {
  _WelcomeStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<WelcomeState> $mapper =
      WelcomeStateMapper.ensureInitialized();
  @override
  SharedPrefsCopyWith<$R, SharedPrefs, SharedPrefs> get sharedPrefs =>
      $value.sharedPrefs.copyWith.$chain((v) => call(sharedPrefs: v));
  @override
  $R call({
    SharedPrefs? sharedPrefs,
    WelcomeStatus? status,
    String? errorMessage,
  }) => $apply(
    FieldCopyWithData({
      if (sharedPrefs != null) #sharedPrefs: sharedPrefs,
      if (status != null) #status: status,
      if (errorMessage != null) #errorMessage: errorMessage,
    }),
  );
  @override
  WelcomeState $make(CopyWithData data) => WelcomeState(
    sharedPrefs: data.get(#sharedPrefs, or: $value.sharedPrefs),
    status: data.get(#status, or: $value.status),
    errorMessage: data.get(#errorMessage, or: $value.errorMessage),
  );

  @override
  WelcomeStateCopyWith<$R2, WelcomeState, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _WelcomeStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

