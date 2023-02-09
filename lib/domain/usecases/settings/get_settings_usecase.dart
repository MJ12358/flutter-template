import 'package:flutter_template/domain/entities/settings.dart';
import 'package:flutter_template/domain/repositories/settings_repository.dart';
import 'package:flutter_template/domain/usecases/usecase.dart';

abstract class GetSettingsUseCase
    implements UseCase<GetSettingsParams, GetSettingsResult> {}

class GetSettingsUseCaseImpl implements GetSettingsUseCase {
  const GetSettingsUseCaseImpl({
    required SettingsRepository settingsRepository,
  }) : _settingsRepository = settingsRepository;

  final SettingsRepository _settingsRepository;

  @override
  Future<GetSettingsResult> call(GetSettingsParams params) async {
    try {
      final Stream<Settings> settings = _settingsRepository.get();
      return GetSettingsResult(
        value: settings,
      );
    } catch (e) {
      return GetSettingsResult(
        errorMessage: '$e',
      );
    }
  }
}

class GetSettingsParams extends UseCaseParams {
  const GetSettingsParams();
}

class GetSettingsResult extends UseCaseResult<Stream<Settings>> {
  const GetSettingsResult({
    super.value = const Stream<Settings>.empty(),
    super.errorMessage,
  });
}
