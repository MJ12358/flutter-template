import 'package:flutter_template/domain/entities/settings.dart';
import 'package:flutter_template/domain/repositories/settings_repository.dart';
import 'package:flutter_template/domain/usecases/usecase.dart';

abstract class SetSettingsUseCase
    implements UseCase<SetSettingsParams, SetSettingsResult> {}

class SetSettingsUseCaseImpl implements SetSettingsUseCase {
  const SetSettingsUseCaseImpl({
    required SettingsRepository settingsRepository,
  }) : _settingsRepository = settingsRepository;

  final SettingsRepository _settingsRepository;

  @override
  Future<SetSettingsResult> call(SetSettingsParams params) async {
    try {
      await _settingsRepository.set(settings: params.settings);
      return const SetSettingsResult();
    } catch (e) {
      return SetSettingsResult(
        errorMessage: '$e',
      );
    }
  }
}

class SetSettingsParams extends UseCaseParams {
  const SetSettingsParams({
    required this.settings,
  });

  final Settings settings;

  @override
  List<Object> get props => <Object>[
        settings,
      ];
}

class SetSettingsResult extends UseCaseResult<void> {
  const SetSettingsResult({
    super.errorMessage,
  });
}
