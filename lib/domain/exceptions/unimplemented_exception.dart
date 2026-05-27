import 'dart:io';

import 'package:flutter_template/domain/exceptions/exception.dart';

class UnimplementedException extends CustomException {
  UnimplementedException._(super.message);

  factory UnimplementedException.platform() {
    final String platform = Platform.operatingSystem;
    final String message =
        'This platform [$platform] is not currently supported.';
    return UnimplementedException._(message);
  }

  factory UnimplementedException.type(Type type) {
    final String message = 'The type [$type] is not currently supported.';
    return UnimplementedException._(message);
  }
}
