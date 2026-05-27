// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'about.dart';

class AboutMapper extends ClassMapperBase<About> {
  AboutMapper._();

  static AboutMapper? _instance;
  static AboutMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AboutMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'About';

  static String _$appId(About v) => v.appId;
  static const Field<About, String> _f$appId = Field(
    'appId',
    _$appId,
    key: r'app_id',
    opt: true,
  );
  static String _$appName(About v) => v.appName;
  static const Field<About, String> _f$appName = Field(
    'appName',
    _$appName,
    key: r'app_name',
    opt: true,
  );
  static String _$appVersion(About v) => v.appVersion;
  static const Field<About, String> _f$appVersion = Field(
    'appVersion',
    _$appVersion,
    key: r'app_version',
    opt: true,
  );
  static String _$buildNumber(About v) => v.buildNumber;
  static const Field<About, String> _f$buildNumber = Field(
    'buildNumber',
    _$buildNumber,
    key: r'build_number',
    opt: true,
  );
  static String _$deviceHardware(About v) => v.deviceHardware;
  static const Field<About, String> _f$deviceHardware = Field(
    'deviceHardware',
    _$deviceHardware,
    key: r'device_hardware',
    opt: true,
  );
  static String _$deviceMake(About v) => v.deviceMake;
  static const Field<About, String> _f$deviceMake = Field(
    'deviceMake',
    _$deviceMake,
    key: r'device_make',
    opt: true,
  );
  static String _$deviceModel(About v) => v.deviceModel;
  static const Field<About, String> _f$deviceModel = Field(
    'deviceModel',
    _$deviceModel,
    key: r'device_model',
    opt: true,
  );
  static int _$sdkVersion(About v) => v.sdkVersion;
  static const Field<About, int> _f$sdkVersion = Field(
    'sdkVersion',
    _$sdkVersion,
    key: r'sdk_version',
    opt: true,
  );

  @override
  final MappableFields<About> fields = const {
    #appId: _f$appId,
    #appName: _f$appName,
    #appVersion: _f$appVersion,
    #buildNumber: _f$buildNumber,
    #deviceHardware: _f$deviceHardware,
    #deviceMake: _f$deviceMake,
    #deviceModel: _f$deviceModel,
    #sdkVersion: _f$sdkVersion,
  };

  static About _instantiate(DecodingData data) {
    return About(
      appId: data.dec(_f$appId),
      appName: data.dec(_f$appName),
      appVersion: data.dec(_f$appVersion),
      buildNumber: data.dec(_f$buildNumber),
      deviceHardware: data.dec(_f$deviceHardware),
      deviceMake: data.dec(_f$deviceMake),
      deviceModel: data.dec(_f$deviceModel),
      sdkVersion: data.dec(_f$sdkVersion),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static About fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<About>(map);
  }

  static About fromJson(String json) {
    return ensureInitialized().decodeJson<About>(json);
  }
}

mixin AboutMappable {
  String toJson() {
    return AboutMapper.ensureInitialized().encodeJson<About>(this as About);
  }

  Map<String, dynamic> toMap() {
    return AboutMapper.ensureInitialized().encodeMap<About>(this as About);
  }

  AboutCopyWith<About, About, About> get copyWith =>
      _AboutCopyWithImpl<About, About>(this as About, $identity, $identity);
  @override
  bool operator ==(Object other) {
    return AboutMapper.ensureInitialized().equalsValue(this as About, other);
  }

  @override
  int get hashCode {
    return AboutMapper.ensureInitialized().hashValue(this as About);
  }
}

extension AboutValueCopy<$R, $Out> on ObjectCopyWith<$R, About, $Out> {
  AboutCopyWith<$R, About, $Out> get $asAbout =>
      $base.as((v, t, t2) => _AboutCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AboutCopyWith<$R, $In extends About, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? appId,
    String? appName,
    String? appVersion,
    String? buildNumber,
    String? deviceHardware,
    String? deviceMake,
    String? deviceModel,
    int? sdkVersion,
  });
  AboutCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AboutCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, About, $Out>
    implements AboutCopyWith<$R, About, $Out> {
  _AboutCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<About> $mapper = AboutMapper.ensureInitialized();
  @override
  $R call({
    Object? appId = $none,
    Object? appName = $none,
    Object? appVersion = $none,
    Object? buildNumber = $none,
    Object? deviceHardware = $none,
    Object? deviceMake = $none,
    Object? deviceModel = $none,
    Object? sdkVersion = $none,
  }) => $apply(
    FieldCopyWithData({
      if (appId != $none) #appId: appId,
      if (appName != $none) #appName: appName,
      if (appVersion != $none) #appVersion: appVersion,
      if (buildNumber != $none) #buildNumber: buildNumber,
      if (deviceHardware != $none) #deviceHardware: deviceHardware,
      if (deviceMake != $none) #deviceMake: deviceMake,
      if (deviceModel != $none) #deviceModel: deviceModel,
      if (sdkVersion != $none) #sdkVersion: sdkVersion,
    }),
  );
  @override
  About $make(CopyWithData data) => About(
    appId: data.get(#appId, or: $value.appId),
    appName: data.get(#appName, or: $value.appName),
    appVersion: data.get(#appVersion, or: $value.appVersion),
    buildNumber: data.get(#buildNumber, or: $value.buildNumber),
    deviceHardware: data.get(#deviceHardware, or: $value.deviceHardware),
    deviceMake: data.get(#deviceMake, or: $value.deviceMake),
    deviceModel: data.get(#deviceModel, or: $value.deviceModel),
    sdkVersion: data.get(#sdkVersion, or: $value.sdkVersion),
  );

  @override
  AboutCopyWith<$R2, About, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _AboutCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

