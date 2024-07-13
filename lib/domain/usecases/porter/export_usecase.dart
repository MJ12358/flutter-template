import 'package:dart_extensionz/dart_extensionz.dart';
import 'package:flutter_template/domain/entities/about.dart';
import 'package:flutter_template/domain/enums/file.dart';
import 'package:flutter_template/domain/repositories/about_repository.dart';
import 'package:flutter_template/domain/repositories/analytics_repository.dart';
import 'package:flutter_template/domain/repositories/file_repository.dart';
import 'package:flutter_template/domain/repositories/permission_repository.dart';
import 'package:flutter_template/domain/repositories/porter_repository.dart';
import 'package:flutter_template/domain/usecases/usecase.dart';

abstract class ExportUseCase implements UseCase<ExportParams, ExportResult> {}

class ExportUseCaseImpl implements ExportUseCase {
  const ExportUseCaseImpl({
    required AboutRepository aboutRepository,
    required AnalyticsRepository analyticsRepository,
    required FileRepository fileRepository,
    required PermissionRepository permissionRepository,
    required PorterRepository porterRepository,
  })  : _aboutRepository = aboutRepository,
        _analyticsRepository = analyticsRepository,
        _fileRepository = fileRepository,
        _permissionRepository = permissionRepository,
        _porterRepository = porterRepository;

  final AboutRepository _aboutRepository;
  final AnalyticsRepository _analyticsRepository;
  final FileRepository _fileRepository;
  final PermissionRepository _permissionRepository;
  final PorterRepository _porterRepository;

  @override
  Future<ExportResult> call(ExportParams params) async {
    try {
      await _permissionRepository.requestStorage();
      final String result = await _porterRepository.export();
      final About about = await _aboutRepository.get();
      final String appName = about.appName;
      final DateTime now = DateTime.now();

      final String fileName = '${appName}_${now.secondsSinceEpoch}.db';

      await _fileRepository.write(
        value: result,
        name: fileName,
        location: FileLocation.downloads,
      );

      return const ExportResult();
    } catch (e, s) {
      _analyticsRepository.logException(
        details: e,
        stackTrace: s,
      );
      return ExportResult(
        errorMessage: '$e',
      );
    }
  }
}

class ExportParams extends UseCaseParams {
  const ExportParams();
}

class ExportResult extends UseCaseResult<void> {
  const ExportResult({
    super.errorMessage,
  });
}
