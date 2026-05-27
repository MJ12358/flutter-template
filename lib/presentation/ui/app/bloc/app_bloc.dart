part of '../app.dart';

class AppBloc extends Cubit<AppState> {
  AppBloc({
    required this._settingsRepository,
    required this._sharedPrefsRepository,
  }) : super(const AppState());

  final SettingsRepository _settingsRepository;
  final SharedPrefsRepository _sharedPrefsRepository;
  StreamSubscription<(Settings, SharedPrefs)>? _streamSubscription;

  AppStatus _getStatus(Settings settings, SharedPrefs sharedPrefs) {
    return sharedPrefs.app.needsWelcome
        ? AppStatus.needsWelcome
        : AppStatus.success;
  }

  Future<void> onInit() async {
    try {
      final Stream<Settings> settings = _settingsRepository.get();
      final Stream<SharedPrefs> sharedPrefs = _sharedPrefsRepository.get();

      final Stream<(Settings, SharedPrefs)> resultStream = Rx.combineLatest2(
        settings,
        sharedPrefs,
        (Settings a, SharedPrefs b) => (a, b),
      );

      _streamSubscription = resultStream.listen(
        _onStreamChanged,
        onError: _onFailure,
      );
    } catch (e) {
      _onFailure(e);
    }
  }

  void _onStreamChanged((Settings, SharedPrefs) data) {
    try {
      final (Settings settings, SharedPrefs sharedPrefs) = data;
      emit(
        state.copyWith(
          status: _getStatus(settings, sharedPrefs),
          settings: settings,
          sharedPrefs: sharedPrefs,
        ),
      );
    } catch (e) {
      _onFailure(e);
    }
  }

  Future<void> onTutorialComplete() {
    return _setSettings(
      state.settings.copyWith(
        needsTutorial: false,
      ),
    );
  }

  @override
  Future<void> close() async {
    await _streamSubscription?.cancel();
    return super.close();
  }

  void _onFailure(Object e) {
    if (!isClosed) {
      emit(
        state.copyWith(
          status: AppStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _setSettings(Settings settings) async {
    if (state.settings == settings) {
      return;
    }
    try {
      await _settingsRepository.set(settings: settings);
    } catch (e) {
      _onFailure(e);
    } finally {
      // Do not set initial status here,
      // as the settings stream will trigger a state change.
    }
  }
}
