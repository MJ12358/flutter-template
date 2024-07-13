import 'dart:convert' as convert;
import 'dart:math' as math;

import 'package:crypto/crypto.dart' as crypto;

class Crypto {
  Crypto._();

  static const String charset =
      '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';

  static String nonce([int length = 32]) {
    final math.Random random = math.Random.secure();
    return List<String>.generate(
      length,
      (_) => charset[random.nextInt(charset.length)],
    ).join();
  }

  static String sha256(String input) {
    final List<int> bytes = convert.utf8.encode(input);
    final crypto.Digest digest = crypto.sha256.convert(bytes);
    return digest.toString();
  }
}
