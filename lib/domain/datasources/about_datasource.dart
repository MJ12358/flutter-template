import 'package:flutter_template/domain/entities/about.dart';

abstract interface class AboutDataSource {
  Future<About> get();
}
