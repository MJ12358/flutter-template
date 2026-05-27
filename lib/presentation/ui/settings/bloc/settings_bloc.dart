part of '../settings.dart';

class SettingsBloc extends Cubit<SettingsState> {
  SettingsBloc({
    required this._settingsRepository,
    required this._sharedPrefsRepository,
  }) : super(const SettingsState());

  final SettingsRepository _settingsRepository;
  final SharedPrefsRepository _sharedPrefsRepository;
  StreamSubscription<(Settings, SharedPrefs)>? _streamSubscription;

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
    final (Settings settings, SharedPrefs sharedPrefs) = data;
    emit(
      state.copyWith(
        status: SettingsStatus.initial,
        settings: settings,
        sharedPrefs: sharedPrefs,
      ),
    );
  }

  Future<void> onDarkModeChanged({
    required bool value,
  }) {
    return _saveSettings(
      state.settings.copyWith(
        darkMode: value,
      ),
    );
  }

  Future<void> onPrimaryColorChanged({
    required int value,
  }) async {
    return _saveSettings(
      state.settings.copyWith(
        primaryColor: value,
      ),
    );
  }

  Future<void> onSecondaryColorChanged({
    required int value,
  }) async {
    return _saveSettings(
      state.settings.copyWith(
        secondaryColor: value,
      ),
    );
  }

  Future<void> onImmersiveModeChanged({
    required bool value,
  }) {
    return _saveSettings(
      state.settings.copyWith(
        immersiveMode: value,
      ),
    );
  }

  Future<void> onAnalyticsChanged({
    required bool value,
  }) {
    return _savePrefs(
      state.sharedPrefs.copyWith(
        app: state.sharedPrefs.app.copyWith(
          analyticsEnabled: value,
        ),
      ),
    );
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }

  Future<void> _saveSettings(Settings settings) async {
    if (state.settings == settings) {
      return;
    }
    try {
      await _settingsRepository.set(settings: settings);
    } catch (e) {
      _onFailure(e);
    } finally {
      _onInitial();
    }
  }

  Future<void> _savePrefs(SharedPrefs prefs) async {
    if (state.sharedPrefs == prefs) {
      return;
    }
    try {
      await _sharedPrefsRepository.set(prefs);
    } catch (e) {
      _onFailure(e);
    } finally {
      _onInitial();
    }
  }

  void _onFailure(Object e) {
    if (!isClosed) {
      emit(
        state.copyWith(
          status: SettingsStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  void _onInitial() {
    if (!isClosed) {
      emit(
        state.copyWith(
          status: SettingsStatus.initial,
        ),
      );
    }
  }
}
