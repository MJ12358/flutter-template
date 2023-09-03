import 'dart:io';

import 'package:dart_extensionz/dart_extensionz.dart';
import 'package:equatable/equatable.dart';

class About extends Equatable {
  const About({
    String? appCode,
    String? appId,
    String? appName,
    String? appVersion,
    String? buildNumber,
    String? deviceDisplay,
    this.deviceDisplayHeight,
    this.deviceDisplayWidth,
    this.deviceDisplaySize,
    String? deviceHardware,
    String? deviceMake,
    String? deviceModel,
    String? deviceVerison,
    int? sdkVersion,
  })  : appCode = appCode ?? '',
        appId = appId ?? '',
        appName = appName ?? '',
        appVersion = appVersion ?? '',
        buildNumber = buildNumber ?? '',
        deviceDisplay = deviceDisplay ?? '',
        deviceHardware = deviceHardware ?? '',
        deviceMake = deviceMake ?? '',
        deviceModel = deviceModel ?? '',
        deviceVerison = deviceVerison ?? '',
        sdkVersion = sdkVersion ?? 0;

  final String appCode;
  final String appId;
  final String appName;
  final String appVersion;
  final String buildNumber;
  final String deviceDisplay;
  final num? deviceDisplayHeight;
  final num? deviceDisplayWidth;
  final num? deviceDisplaySize;
  final String deviceHardware;
  final String deviceMake;
  final String deviceModel;
  final String deviceVerison;
  final int sdkVersion;

  String get operatingSystem => Platform.operatingSystem;
  String get operatingSystemVersion => Platform.operatingSystemVersion;
  num get numberOfProcessors => Platform.numberOfProcessors;

  String get legalese => '© company.com ${DateTime.now().year}';

  String get formattedDeviceDisplaySize {
    String result = '';
    final num? height = deviceDisplayHeight?.round();
    final num? width = deviceDisplayWidth?.round();
    final double? size = deviceDisplaySize?.toDouble().roundDouble();

    if (height != null && width != null) {
      result += '$height x $width';
    }

    if (size != null) {
      if (result.isEmpty) {
        result += '$size';
      } else {
        result += ' @ $size';
      }
    }
    return result;
  }

  String get formattedVersion {
    String result = '';
    final String version = appVersion;
    final String build = buildNumber;

    if (version.isNotEmpty && build.isNotEmpty) {
      result = '$version+$build';
    }
    return result;
  }

  @override
  List<Object?> get props => <Object?>[
        appCode,
        appId,
        appName,
        appVersion,
        buildNumber,
        deviceDisplay,
        deviceDisplayHeight,
        deviceDisplayWidth,
        deviceDisplaySize,
        deviceHardware,
        deviceMake,
        deviceModel,
        deviceVerison,
      ];

  @override
  String toString() {
    return 'About(appName: $appName)';
  }
}
