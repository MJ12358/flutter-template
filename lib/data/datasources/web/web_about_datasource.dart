import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_template/data/models/web/web_about_model.dart';
import 'package:flutter_template/domain/datasources/about_datasource.dart';
import 'package:flutter_template/domain/entities/about.dart';
import 'package:package_info_plus/package_info_plus.dart';

class WebAboutDataSource extends AboutDataSource {
  @override
  Future<About> get() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final WebBrowserInfo browserInfo = await DeviceInfoPlugin().webBrowserInfo;

    return WebAboutModel.fromInfo(
      browserInfo: browserInfo,
      packageInfo: packageInfo,
    );
  }
}
