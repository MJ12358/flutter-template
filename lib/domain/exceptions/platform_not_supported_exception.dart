import 'dart:io';

import 'package:flutter_template/domain/exceptions/exception.dart';

class PlatformNotSupportedException extends CustomException {
  PlatformNotSupportedException()
      : super(
          'This platform [$platform] is not currently supported.',
        );

  static String platform = Platform.operatingSystem;
}
