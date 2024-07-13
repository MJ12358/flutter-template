import 'dart:typed_data';

import 'package:flutter_template/domain/enums/file.dart';
import 'package:flutter_template/domain/repositories/analytics_repository.dart';
import 'package:flutter_template/domain/repositories/file_repository.dart';
import 'package:flutter_template/domain/usecases/usecase.dart';

abstract class PickFileUseCase
    implements UseCase<PickFileParams, PickFileResult> {}

class PickFileUseCaseImpl implements PickFileUseCase {
  const PickFileUseCaseImpl({
    required AnalyticsRepository analyticsRepository,
    required FileRepository fileRepository,
  })  : _analyticsRepository = analyticsRepository,
        _fileRepository = fileRepository;

  final AnalyticsRepository _analyticsRepository;
  final FileRepository _fileRepository;

  @override
  Future<PickFileResult> call(PickFileParams params) async {
    try {
      final Uint8List? file = await _fileRepository.pick(
        source: params.source,
      );
      return PickFileResult(
        value: file,
      );
    } catch (e, s) {
      _analyticsRepository.logException(
        details: e,
        stackTrace: s,
      );
      return PickFileResult(
        errorMessage: '$e',
      );
    }
  }
}

class PickFileParams extends UseCaseParams {
  const PickFileParams({
    required this.source,
  });

  final FileSource source;

  @override
  List<Object> get props => <Object>[
        source,
      ];
}

class PickFileResult extends UseCaseResult<Uint8List?> {
  const PickFileResult({
    super.value,
    super.errorMessage,
  });
}
