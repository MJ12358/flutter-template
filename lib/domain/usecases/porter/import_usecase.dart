import 'dart:typed_data';

import 'package:flutter_template/domain/exceptions/exception.dart';
import 'package:flutter_template/domain/repositories/analytics_repository.dart';
import 'package:flutter_template/domain/repositories/file_repository.dart';
import 'package:flutter_template/domain/repositories/porter_repository.dart';
import 'package:flutter_template/domain/usecases/usecase.dart';

abstract class ImportUseCase implements UseCase<ImportParams, ImportResult> {}

class ImportUseCaseImpl implements ImportUseCase {
  const ImportUseCaseImpl({
    required AnalyticsRepository analyticsRepository,
    required FileRepository fileRepository,
    required PorterRepository porterRepository,
  })  : _analyticsRepository = analyticsRepository,
        _fileRepository = fileRepository,
        _porterRepository = porterRepository;

  final AnalyticsRepository _analyticsRepository;
  final FileRepository _fileRepository;
  final PorterRepository _porterRepository;

  @override
  Future<ImportResult> call(ImportParams params) async {
    try {
      final Uint8List? data = await _fileRepository.pick();

      if (data == null) {
        throw CustomException('You canceled the import.');
      }

      await _porterRepository.import(data: String.fromCharCodes(data));

      return const ImportResult();
    } catch (e, s) {
      _analyticsRepository.logException(
        details: e,
        stackTrace: s,
      );
      return ImportResult(
        errorMessage: '$e',
      );
    }
  }
}

class ImportParams extends UseCaseParams {
  const ImportParams();
}

class ImportResult extends UseCaseResult<void> {
  const ImportResult({
    super.errorMessage,
  });
}
