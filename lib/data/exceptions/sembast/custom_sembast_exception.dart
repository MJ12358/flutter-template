import 'package:flutter_template/domain/exceptions/exception.dart';

class CustomSembastException extends CustomException {
  CustomSembastException([
    String? message = 'An unknown Sembast error occurred.',
  ]) : super(message);
}
