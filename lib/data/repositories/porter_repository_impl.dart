import 'package:flutter_template/domain/core/database.dart';
import 'package:flutter_template/domain/repositories/analytics_repository.dart';
import 'package:flutter_template/domain/repositories/porter_repository.dart';

class PorterRepositoryImpl implements PorterRepository {
  const PorterRepositoryImpl({
    required AnalyticsRepository analyticsRepository,
    required Database localDataSource,
  })  : _analyticsRepository = analyticsRepository,
        _localDataSource = localDataSource;

  final AnalyticsRepository _analyticsRepository;
  final Database _localDataSource;

  @override
  Future<String> export() {
    try {
      return _localDataSource.export();
    } catch (e, s) {
      _analyticsRepository.logException(
        details: e,
        stackTrace: s,
      );
      rethrow;
    }
  }

  @override
  Future<void> import({
    required String data,
  }) {
    try {
      return _localDataSource.import(data: data);
    } catch (e, s) {
      _analyticsRepository.logException(
        details: e,
        stackTrace: s,
      );
      rethrow;
    }
  }
}
