import 'package:flutter_template/domain/exceptions/exception.dart';

class PermissionException extends CustomException {
  PermissionException._(super.message);

  factory PermissionException.denied(String action) {
    final String message = 'User denied permission for this action. [$action]';
    return PermissionException._(message);
  }

  factory PermissionException.deniedPermanently(String action) {
    final String message =
        'User permanently denied permission for this action. [$action]\n'
        'To re-enable, go into your operating systems settings.';
    return PermissionException._(message);
  }
}
