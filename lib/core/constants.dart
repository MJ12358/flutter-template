abstract class Asset {
  static const String launcher = 'assets/images/flutter_logo.png';
  static const String splash = 'assets/logos/flutter_logo.png';
}

abstract class Opaque {
  static const double full = 1.0;
  static double get quarter => full * 0.25;
  static double get half => full * 0.50;
  static double get threeQuarter => full * 0.75;
}

abstract class Period {
  // in milliseconds
  static const int full = 500;
  static int get quarter => (full * 0.25).toInt();
  static int get half => (full * 0.50).toInt();
  static int get duplex => (full * 2.0).toInt();
}

abstract class Style {
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
}
