import 'package:flutter_template/domain/exceptions/exception.dart';

class CustomSembastException extends CustomException {
  CustomSembastException([
    super.message = 'An unknown Sembast error occurred.',
  ]);
}
