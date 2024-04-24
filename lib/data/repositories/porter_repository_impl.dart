import 'package:flutter_template/domain/core/database.dart';
import 'package:flutter_template/domain/repositories/porter_repository.dart';

class PorterRepositoryImpl implements PorterRepository {
  const PorterRepositoryImpl({
    required Database localDataSource,
  }) : _localDataSource = localDataSource;

  final Database _localDataSource;

  @override
  Future<String> export() {
    return _localDataSource.export();
  }

  @override
  Future<void> import({
    required String data,
  }) {
    return _localDataSource.import(data: data);
  }
}
