import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_template/domain/entities/about.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AndroidAboutModel extends About {
  const AndroidAboutModel({
    super.appId,
    super.appName,
    super.appVersion,
    super.buildNumber,
    super.deviceHardware,
    super.deviceMake,
    super.deviceModel,
    super.sdkVersion,
  });

  factory AndroidAboutModel.fromInfo({
    required AndroidDeviceInfo deviceInfo,
    required PackageInfo packageInfo,
  }) {
    return AndroidAboutModel(
      appId: packageInfo.packageName,
      appName: packageInfo.appName,
      appVersion: packageInfo.version,
      buildNumber: packageInfo.buildNumber,
      deviceHardware: deviceInfo.hardware,
      deviceMake: deviceInfo.manufacturer,
      deviceModel: deviceInfo.model,
      sdkVersion: deviceInfo.version.sdkInt,
    );
  }
}
