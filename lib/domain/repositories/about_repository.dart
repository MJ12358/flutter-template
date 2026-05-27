import 'package:flutter_template/domain/entities/about.dart';

abstract interface class AboutRepository {
  Future<About> get();
}
