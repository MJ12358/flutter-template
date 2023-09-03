import 'dart:io';

import 'package:flutter_template/domain/exceptions/exception.dart';

class PermissionDeniedException extends CustomException {
  PermissionDeniedException()
      : super(
          'User denied permission for this action. [$platform]',
        );

  static String platform = Platform.operatingSystem;
}
