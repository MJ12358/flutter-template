import 'dart:io';

import 'package:flutter_template/domain/exceptions/exception.dart';

class PlatformException extends CustomException {
  PlatformException._(super.message);

  static final String _platform = Platform.operatingSystem;

  /// This means the current platform this app is running on is not supported.
  factory PlatformException.notSupported() {
    final String message =
        'This platform [$_platform] is not currently supported.';
    return PlatformException._(message);
  }
}
