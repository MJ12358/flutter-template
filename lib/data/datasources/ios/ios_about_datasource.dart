import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_template/data/models/ios/ios_about_model.dart';
import 'package:flutter_template/domain/datasources/about_datasource.dart';
import 'package:flutter_template/domain/entities/about.dart';
import 'package:package_info_plus/package_info_plus.dart';

class IOSAboutDataSource implements AboutDataSource {
  @override
  Future<About> get() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final IosDeviceInfo deviceInfo = await DeviceInfoPlugin().iosInfo;

    return IOSAboutModel.fromInfo(
      deviceInfo: deviceInfo,
      packageInfo: packageInfo,
    );
  }
}
