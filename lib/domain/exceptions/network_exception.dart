import 'package:flutter_template/domain/exceptions/exception.dart';

class NetworkException extends CustomException {
  NetworkException._(super.message);

  /// This means that any network (be it wifi, bluetooth, vpn) is not available.
  factory NetworkException.notAvailable() {
    const String message =
        'Network not available, please enable and try again.';
    return NetworkException._(message);
  }

  /// This means that we cannot connect to the network.
  factory NetworkException.notConnected() {
    const String message =
        'Network not connected, please connect and try again.';
    return NetworkException._(message);
  }
}
