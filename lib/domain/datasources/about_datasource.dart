import 'package:flutter_template/domain/entities/about.dart';

abstract class AboutDataSource {
  Future<About> get();
}
