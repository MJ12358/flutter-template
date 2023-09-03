import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_template/data/models/android/android_about_model.dart';
import 'package:flutter_template/domain/datasources/about_datasource.dart';
import 'package:flutter_template/domain/entities/about.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AndroidAboutDataSource implements AboutDataSource {
  @override
  Future<About> get() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final AndroidDeviceInfo deviceInfo = await DeviceInfoPlugin().androidInfo;

    return AndroidAboutModel.fromInfo(
      deviceInfo: deviceInfo,
      packageInfo: packageInfo,
    );
  }
}
