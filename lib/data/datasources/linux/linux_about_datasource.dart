import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_template/data/models/linux/linux_about_model.dart';
import 'package:flutter_template/domain/datasources/about_datasource.dart';
import 'package:flutter_template/domain/entities/about.dart';
import 'package:package_info_plus/package_info_plus.dart';

class LinuxAboutDataSource extends AboutDataSource {
  @override
  Future<About> get() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final LinuxDeviceInfo deviceInfo = await DeviceInfoPlugin().linuxInfo;

    return LinuxAboutModel.fromInfo(
      deviceInfo: deviceInfo,
      packageInfo: packageInfo,
    );
  }
}
