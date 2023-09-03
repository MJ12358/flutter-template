import 'package:flutter_template/domain/exceptions/exception.dart';

class NetworkNotConnectedException extends CustomException {
  NetworkNotConnectedException([
    super.message = 'Network not available, please connect and try again.',
  ]);
}
