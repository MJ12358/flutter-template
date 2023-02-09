import 'package:flutter_template_bloc/presentation/ui/app/app.dart';
import 'package:get_it/get_it.dart';

abstract class Injector {
  static final GetIt sl = GetIt.instance;
  static const String local = 'local';
  static const String remote = 'remote';
  static const String android = 'android';
  static const String ios = 'ios';

  static Future<void> init() async {
    sl.registerLazySingleton<AppBloc>(() {
      return AppBloc();
    });
  }
}
