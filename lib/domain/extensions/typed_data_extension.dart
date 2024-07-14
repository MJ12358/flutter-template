import 'dart:convert';
import 'dart:typed_data';

extension Uint8ListExtension on Uint8List? {
  String? get string {
    if (this == null) {
      return null;
    }
    try {
      return base64.encode(this!);
    } on FormatException {
      return String.fromCharCodes(this!);
    }
  }
}

extension StringExtension on String? {
  Uint8List? get uint8List {
    if (this == null) {
      return null;
    }
    try {
      return base64.decode(this!);
    } on FormatException {
      return Uint8List.fromList(this!.codeUnits);
    }
  }
}
