import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_template/domain/entities/about.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AndroidAboutModel extends About {
  const AndroidAboutModel({
    super.appCode,
    super.appId,
    super.appName,
    super.appVersion,
    super.buildNumber,
    super.deviceDisplay,
    super.deviceDisplayHeight,
    super.deviceDisplayWidth,
    super.deviceDisplaySize,
    super.deviceHardware,
    super.deviceMake,
    super.deviceModel,
    super.deviceVerison,
    super.sdkVersion,
  });

  factory AndroidAboutModel.fromInfo({
    required AndroidDeviceInfo deviceInfo,
    required PackageInfo packageInfo,
  }) {
    return AndroidAboutModel(
      appCode: packageInfo.buildNumber,
      appId: packageInfo.packageName,
      appName: packageInfo.appName,
      appVersion: packageInfo.version,
      buildNumber: packageInfo.buildNumber,
      deviceDisplay: deviceInfo.display,
      deviceDisplayHeight: deviceInfo.displayMetrics.heightPx,
      deviceDisplayWidth: deviceInfo.displayMetrics.widthPx,
      deviceDisplaySize: deviceInfo.displayMetrics.sizeInches,
      deviceHardware: deviceInfo.hardware,
      deviceMake: deviceInfo.manufacturer,
      deviceModel: deviceInfo.model,
      deviceVerison: deviceInfo.version.release,
      sdkVersion: deviceInfo.version.sdkInt,
    );
  }
}
