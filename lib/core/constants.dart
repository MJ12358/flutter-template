import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart' as material;

class Asset {
  Asset._();

  /// The launcher asset.
  static const String launcher = 'assets/logos/launcher.png';

  /// The splash asset.
  static const String splash = 'assets/logos/splash.png';

  static const String welcome1Image = 'assets/images/welcome/welcome_1.png';
  static const String welcome2Image = 'assets/images/welcome/welcome_2.png';
}

class Build {
  Build._();

  /// A constant that is true if the application was compiled in debug mode.
  static const bool isDebug = foundation.kDebugMode;

  /// A constant that is true if the application was compiled in release mode.
  static const bool isRelease = foundation.kReleaseMode;

  /// A constant that is true if the application was compiled in profile mode.
  static const bool isProfile = foundation.kProfileMode;

  /// A constant that is true if the application was compiled to run on the web.
  static const bool isWeb = foundation.kIsWeb;
}

class Opaque {
  Opaque._();

  /// A constant depicting a "full" opacity.
  static const double full = 1.0;

  /// One quarter of [full].
  static double get quarter => full * 0.25;

  /// One half of [full].
  static double get half => full * 0.50;

  /// Three quarter of [full].
  static double get threeQuarter => full * 0.75;
}

class Period {
  Period._();

  /// A constant depicting a "full" period in milliseconds.
  static const int full = 500;

  /// One quarter of [full] in milliseconds.
  static int get quarter => (full * 0.25).toInt();

  /// One half of [full] in milliseconds.
  static int get half => (full * 0.50).toInt();

  /// Double [full] in milliseconds.
  static int get duplex => (full * 2.0).toInt();
}

class Style {
  Style._();
  static const double letterSpacingSmall = 0.75;
  static const double letterSpacingMedium = 1.25;
  static const double letterSpacingLarge = 1.50;

  static const double spacingXSmall = 4.0;
  static const double spacingSmall = 8.0;
  static const double spacingMedium = 20.0;
  static const double spacingLarge = 32.0;

  static const double radiusSmall = 4.0;
  static const double radiusMedium = 8.0;
  static const double radiusLarge = 15.0;

  static const material.Color transparent = material.Colors.transparent;
  static const material.Color black = material.Colors.black;
  static final material.Color black05 = black.withOpacity(0.05);
  static final material.Color black15 = black.withOpacity(0.15);
  static final material.Color black50 = black.withOpacity(0.50);
  static const material.Color blue = material.Colors.blue;
  static const material.Color green = material.Colors.green;
  static const material.Color white = material.Colors.white;
}

class Url {
  Url._();
  static const String website = 'https://www.example.com';
  static const String privacyPolicy = 'https://www.example.com/#/privacy';
  static const String youtube =
      'https://www.youtube.com/@flutter_template/featured';
  static const String facebook = 'https://www.facebook.com/flutter_template';
}
