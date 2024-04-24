import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_template/domain/entities/about.dart';
import 'package:package_info_plus/package_info_plus.dart';

class LinuxAboutModel extends About {
  const LinuxAboutModel({
    super.appCode,
    super.appId,
    super.appName,
    super.appVersion,
    super.buildNumber,
    super.deviceHardware,
    super.deviceMake,
    super.deviceModel,
    super.deviceVerison,
  });

  factory LinuxAboutModel.fromInfo({
    required LinuxDeviceInfo deviceInfo,
    required PackageInfo packageInfo,
  }) {
    return LinuxAboutModel(
      appCode: packageInfo.buildNumber,
      appId: packageInfo.packageName,
      appName: packageInfo.appName,
      appVersion: packageInfo.version,
      buildNumber: packageInfo.buildNumber,
      deviceMake: deviceInfo.machineId,
      deviceModel: deviceInfo.variantId,
      deviceVerison: deviceInfo.version,
    );
  }
}
