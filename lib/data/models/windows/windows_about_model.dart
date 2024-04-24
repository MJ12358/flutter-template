import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_template/domain/entities/about.dart';
import 'package:package_info_plus/package_info_plus.dart';

class WindowsAboutModel extends About {
  const WindowsAboutModel({
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

  factory WindowsAboutModel.fromInfo({
    required WindowsDeviceInfo deviceInfo,
    required PackageInfo packageInfo,
  }) {
    return WindowsAboutModel(
      appCode: packageInfo.buildNumber,
      appId: packageInfo.packageName,
      appName: packageInfo.appName,
      appVersion: packageInfo.version,
      buildNumber: packageInfo.buildNumber,
      deviceHardware: deviceInfo.numberOfCores.toString(),
      deviceMake: deviceInfo.productName,
      deviceModel: deviceInfo.productType.toString(),
      deviceVerison: deviceInfo.displayVersion,
    );
  }
}
