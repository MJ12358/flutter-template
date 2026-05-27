// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'settings.dart';

class SettingsMapper extends ClassMapperBase<Settings> {
  SettingsMapper._();

  static SettingsMapper? _instance;
  static SettingsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SettingsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Settings';

  static int _$id(Settings v) => v.id;
  static const Field<Settings, int> _f$id = Field('id', _$id, opt: true);
  static bool _$needsTutorial(Settings v) => v.needsTutorial;
  static const Field<Settings, bool> _f$needsTutorial = Field(
    'needsTutorial',
    _$needsTutorial,
    key: r'needs_tutorial',
    opt: true,
  );
  static bool _$darkMode(Settings v) => v.darkMode;
  static const Field<Settings, bool> _f$darkMode = Field(
    'darkMode',
    _$darkMode,
    key: r'dark_mode',
    opt: true,
  );
  static int _$primaryColor(Settings v) => v.primaryColor;
  static const Field<Settings, int> _f$primaryColor = Field(
    'primaryColor',
    _$primaryColor,
    key: r'primary_color',
    opt: true,
  );
  static int _$secondaryColor(Settings v) => v.secondaryColor;
  static const Field<Settings, int> _f$secondaryColor = Field(
    'secondaryColor',
    _$secondaryColor,
    key: r'secondary_color',
    opt: true,
  );
  static bool _$immersiveMode(Settings v) => v.immersiveMode;
  static const Field<Settings, bool> _f$immersiveMode = Field(
    'immersiveMode',
    _$immersiveMode,
    key: r'immersive_mode',
    opt: true,
  );
  static bool _$confirmExit(Settings v) => v.confirmExit;
  static const Field<Settings, bool> _f$confirmExit = Field(
    'confirmExit',
    _$confirmExit,
    key: r'confirm_exit',
    opt: true,
  );

  @override
  final MappableFields<Settings> fields = const {
    #id: _f$id,
    #needsTutorial: _f$needsTutorial,
    #darkMode: _f$darkMode,
    #primaryColor: _f$primaryColor,
    #secondaryColor: _f$secondaryColor,
    #immersiveMode: _f$immersiveMode,
    #confirmExit: _f$confirmExit,
  };

  static Settings _instantiate(DecodingData data) {
    return Settings(
      id: data.dec(_f$id),
      needsTutorial: data.dec(_f$needsTutorial),
      darkMode: data.dec(_f$darkMode),
      primaryColor: data.dec(_f$primaryColor),
      secondaryColor: data.dec(_f$secondaryColor),
      immersiveMode: data.dec(_f$immersiveMode),
      confirmExit: data.dec(_f$confirmExit),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Settings fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Settings>(map);
  }

  static Settings fromJson(String json) {
    return ensureInitialized().decodeJson<Settings>(json);
  }
}

mixin SettingsMappable {
  String toJson() {
    return SettingsMapper.ensureInitialized().encodeJson<Settings>(
      this as Settings,
    );
  }

  Map<String, dynamic> toMap() {
    return SettingsMapper.ensureInitialized().encodeMap<Settings>(
      this as Settings,
    );
  }

  SettingsCopyWith<Settings, Settings, Settings> get copyWith =>
      _SettingsCopyWithImpl<Settings, Settings>(
        this as Settings,
        $identity,
        $identity,
      );
  @override
  bool operator ==(Object other) {
    return SettingsMapper.ensureInitialized().equalsValue(
      this as Settings,
      other,
    );
  }

  @override
  int get hashCode {
    return SettingsMapper.ensureInitialized().hashValue(this as Settings);
  }
}

extension SettingsValueCopy<$R, $Out> on ObjectCopyWith<$R, Settings, $Out> {
  SettingsCopyWith<$R, Settings, $Out> get $asSettings =>
      $base.as((v, t, t2) => _SettingsCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SettingsCopyWith<$R, $In extends Settings, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    int? id,
    bool? needsTutorial,
    bool? darkMode,
    int? primaryColor,
    int? secondaryColor,
    bool? immersiveMode,
    bool? confirmExit,
  });
  SettingsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SettingsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Settings, $Out>
    implements SettingsCopyWith<$R, Settings, $Out> {
  _SettingsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Settings> $mapper =
      SettingsMapper.ensureInitialized();
  @override
  $R call({
    Object? id = $none,
    Object? needsTutorial = $none,
    Object? darkMode = $none,
    Object? primaryColor = $none,
    Object? secondaryColor = $none,
    Object? immersiveMode = $none,
    Object? confirmExit = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != $none) #id: id,
      if (needsTutorial != $none) #needsTutorial: needsTutorial,
      if (darkMode != $none) #darkMode: darkMode,
      if (primaryColor != $none) #primaryColor: primaryColor,
      if (secondaryColor != $none) #secondaryColor: secondaryColor,
      if (immersiveMode != $none) #immersiveMode: immersiveMode,
      if (confirmExit != $none) #confirmExit: confirmExit,
    }),
  );
  @override
  Settings $make(CopyWithData data) => Settings(
    id: data.get(#id, or: $value.id),
    needsTutorial: data.get(#needsTutorial, or: $value.needsTutorial),
    darkMode: data.get(#darkMode, or: $value.darkMode),
    primaryColor: data.get(#primaryColor, or: $value.primaryColor),
    secondaryColor: data.get(#secondaryColor, or: $value.secondaryColor),
    immersiveMode: data.get(#immersiveMode, or: $value.immersiveMode),
    confirmExit: data.get(#confirmExit, or: $value.confirmExit),
  );

  @override
  SettingsCopyWith<$R2, Settings, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _SettingsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

