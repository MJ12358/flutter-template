import 'package:dart_extensionz/dart_extensionz.dart';
import 'package:flutter_template/domain/datasources/about_datasource.dart';
import 'package:flutter_template/domain/entities/about.dart';
import 'package:flutter_template/domain/exceptions/unimplemented_exception.dart';
import 'package:flutter_template/domain/repositories/about_repository.dart';
import 'package:flutter_template/domain/repositories/log_repository.dart';

class AboutRepositoryImpl implements AboutRepository {
  const AboutRepositoryImpl({
    required this._logRepository,
    required this._androidDataSource,
    required this._iosDataSource,
  });

  final LogRepository _logRepository;
  final AboutDataSource _androidDataSource;
  final AboutDataSource _iosDataSource;

  @override
  Future<About> get() {
    try {
      switch (PlatformExtension.target) {
        case TargetPlatform.android:
          return _androidDataSource.get();
        case TargetPlatform.iOS:
          return _iosDataSource.get();
        default:
          throw UnimplementedException.platform();
      }
    } catch (e, s) {
      _logRepository.error(
        message: e,
        trace: s,
      );
      rethrow;
    }
  }
}
