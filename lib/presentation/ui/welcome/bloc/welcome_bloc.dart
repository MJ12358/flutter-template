part of '../welcome.dart';

class WelcomeBloc extends Cubit<WelcomeState> {
  WelcomeBloc({
    required SettingsRepository settingsRepository,
  })  : _settingsRepository = settingsRepository,
        super(const WelcomeState());

  final SettingsRepository _settingsRepository;

  Future<void> onInit() async {
    try {
      final Settings settings = await _settingsRepository.get().first;
      emit(
        state.copyWith(
          status: WelcomeStatus.initial,
          settings: settings,
        ),
      );
    } catch (e) {
      onFailure(message: e.toString());
    }
  }

  void onFailure({
    required String message,
  }) {
    emit(
      state.copyWith(
        status: WelcomeStatus.failure,
        errorMessage: message,
      ),
    );
  }

  Future<void> onComplete() async {
    try {
      await _settingsRepository.set(
        settings: state.settings.copyWith(
          needsWelcome: false,
        ),
      );
      emit(
        state.copyWith(
          status: WelcomeStatus.complete,
        ),
      );
    } catch (e) {
      onFailure(message: e.toString());
    }
  }
}
