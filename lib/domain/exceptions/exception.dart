// ignore_for_file: no_runtimetype_tostring

import 'package:dart_extensionz/dart_extensionz.dart';

class CustomException implements Exception {
  CustomException([
    this.message,
  ]);

  final String? message;

  @override
  String toString() {
    final String? message = this.message;
    if (message == null || message.isBlank) {
      return '$runtimeType: An unknown error occurred.';
    }
    return message;
  }
}
