import 'dart:io';

import 'package:dart_mappable/dart_mappable.dart';

part 'about.g.dart';

@MappableClass()
class About with AboutMappable {
  const About({
    String? appId,
    String? appName,
    String? appVersion,
    String? buildNumber,
    String? deviceHardware,
    String? deviceMake,
    String? deviceModel,
    int? sdkVersion,
  }) : appId = appId ?? '',
       appName = appName ?? '',
       appVersion = appVersion ?? '',
       buildNumber = buildNumber ?? '',
       deviceHardware = deviceHardware ?? '',
       deviceMake = deviceMake ?? '',
       deviceModel = deviceModel ?? '',
       sdkVersion = sdkVersion ?? 0;

  final String appId;
  final String appName;
  final String appVersion;
  final String buildNumber;
  final String deviceHardware;
  final String deviceMake;
  final String deviceModel;
  final int sdkVersion;

  String get operatingSystem => Platform.operatingSystem;
  String get operatingSystemVersion => Platform.operatingSystemVersion;
  num get numberOfProcessors => Platform.numberOfProcessors;

  String get legalese => '© flutter_template.com ${DateTime.now().year}';

  String get formattedVersion {
    String result = '';
    final String version = appVersion;
    final String build = buildNumber;

    if (version.isNotEmpty && build.isNotEmpty) {
      result = '$version+$build';
    } else if (version.isNotEmpty) {
      result = version;
    } else if (build.isNotEmpty) {
      result = build;
    }
    return result;
  }

  @override
  String toString() {
    return 'Version: $formattedVersion\n'
        'Device: $deviceMake $deviceModel ($deviceHardware)\n'
        'OS: $operatingSystem $operatingSystemVersion\n'
        'SDK: $sdkVersion';
  }
}
