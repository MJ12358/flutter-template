import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_template/domain/entities/about.dart';
import 'package:package_info_plus/package_info_plus.dart';

class IOSAboutModel extends About {
  const IOSAboutModel({
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

  factory IOSAboutModel.fromInfo({
    required IosDeviceInfo deviceInfo,
    required PackageInfo packageInfo,
  }) {
    return IOSAboutModel(
      appCode: packageInfo.buildNumber,
      appId: packageInfo.packageName,
      appName: packageInfo.appName,
      appVersion: packageInfo.version,
      buildNumber: packageInfo.buildNumber,
      deviceHardware: deviceInfo.utsname.machine,
      deviceMake: 'Apple',
      deviceModel: deviceInfo.model,
      deviceVerison: deviceInfo.systemVersion,
    );
  }
}
