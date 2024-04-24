import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_template/domain/entities/about.dart';
import 'package:package_info_plus/package_info_plus.dart';

class WebAboutModel extends About {
  const WebAboutModel({
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

  factory WebAboutModel.fromInfo({
    required WebBrowserInfo browserInfo,
    required PackageInfo packageInfo,
  }) {
    return WebAboutModel(
      appCode: packageInfo.buildNumber,
      appId: packageInfo.packageName,
      appName: packageInfo.appName,
      appVersion: packageInfo.version,
      buildNumber: packageInfo.buildNumber,
      deviceHardware: browserInfo.platform,
      deviceMake: browserInfo.vendor,
      deviceModel: browserInfo.vendorSub,
      deviceVerison: browserInfo.productSub,
    );
  }
}
