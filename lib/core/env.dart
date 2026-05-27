import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'MY_API_KEY', obfuscate: true)
  static String myApiKey = _Env.myApiKey;
}
