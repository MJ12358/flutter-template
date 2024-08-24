part of '../app.dart';

class AppBloc extends Cubit<AppState> {
  AppBloc({
    required SettingsRepository settingsRepository,
  })  : _settingsRepository = settingsRepository,
        super(const AppState());

  final SettingsRepository _settingsRepository;
  StreamSubscription<Settings>? _settingsSubscription;

  AppStatus _getStatus(Settings settings) {
    return settings.needsWelcome ? AppStatus.needsWelcome : AppStatus.success;
  }

  Future<void> onInit() async {
    try {
      final Stream<Settings> settings = _settingsRepository.get();
      _settingsSubscription = settings.listen((Settings event) {
        onSettingsChanged(value: event);
      })
        ..onError((Object e) => onFailure(message: e.toString()));
    } catch (e) {
      onFailure(message: e.toString());
    }
  }

  void onFailure({
    required String message,
  }) {
    emit(
      state.copyWith(
        status: AppStatus.failure,
        errorMessage: message,
      ),
    );
  }

  void onSettingsChanged({
    required Settings value,
  }) {
    emit(
      state.copyWith(
        status: _getStatus(value),
        settings: value,
      ),
    );
  }

  Future<void> onTutorialComplete() {
    return _setSettings(
      state.settings.copyWith(
        needsTutorial: false,
      ),
    );
  }

  @override
  Future<void> close() {
    _settingsSubscription?.cancel();
    return super.close();
  }

  Future<void> _setSettings(Settings settings) async {
    try {
      await _settingsRepository.set(settings: settings);
    } catch (e) {
      onFailure(message: e.toString());
    }
  }
}
