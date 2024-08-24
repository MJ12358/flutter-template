part of '../settings.dart';

class SettingsBloc extends Cubit<SettingsState> {
  SettingsBloc({
    required AboutRepository aboutRepository,
    required FileRepository fileRepository,
    required PermissionRepository permissionRepository,
    required PorterRepository porterRepository,
    required SettingsRepository settingsRepository,
  })  : _aboutRepository = aboutRepository,
        _fileRepository = fileRepository,
        _permissionRepository = permissionRepository,
        _porterRepository = porterRepository,
        _settingsRepository = settingsRepository,
        super(const SettingsState());

  final AboutRepository _aboutRepository;
  final FileRepository _fileRepository;
  final PermissionRepository _permissionRepository;
  final PorterRepository _porterRepository;
  final SettingsRepository _settingsRepository;
  StreamSubscription<Settings>? _streamSubscription;

  Future<void> onInit() async {
    try {
      final Stream<Settings> settings = _settingsRepository.get();
      _streamSubscription = settings.listen((Settings event) {
        onChanged(settings: event);
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
        status: SettingsStatus.failure,
        errorMessage: message,
      ),
    );
  }

  void onChanged({
    required Settings settings,
  }) {
    emit(
      state.copyWith(
        status: SettingsStatus.success,
        settings: settings,
      ),
    );
  }

  Future<void> onDarkModeChanged({
    required bool value,
  }) {
    return _setSettings(
      state.settings.copyWith(darkMode: value),
    );
  }

  Future<void> onPrimaryColorChanged({
    required int value,
  }) {
    return _setSettings(
      state.settings.copyWith(primaryColor: value),
    );
  }

  Future<void> onSecondaryColorChanged({
    required int value,
  }) {
    return _setSettings(
      state.settings.copyWith(secondaryColor: value),
    );
  }

  Future<void> onMaterialGridChanged({
    required bool value,
  }) {
    return _setSettings(
      state.settings.copyWith(showMaterialGrid: value),
    );
  }

  Future<void> onPerformanceOverlayChanged({
    required bool value,
  }) {
    return _setSettings(
      state.settings.copyWith(showPerformanceOverlay: value),
    );
  }

  Future<void> onImmersiveModeChanged({
    required bool value,
  }) {
    return _setSettings(
      state.settings.copyWith(immersiveMode: value),
    );
  }

  Future<void> onSemanticOverlayChanged({
    required bool value,
  }) {
    return _setSettings(
      state.settings.copyWith(showSemanticOverlay: value),
    );
  }

  Future<void> onAnalyticsChanged({
    required bool value,
  }) {
    return _setSettings(
      state.settings.copyWith(analytics: value),
    );
  }

  Future<void> onExport() async {
    emit(
      state.copyWith(
        status: SettingsStatus.exportInProgress,
      ),
    );
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
      emit(
        state.copyWith(
          status: SettingsStatus.exportSuccess,
        ),
      );
    } catch (e) {
      onFailure(message: e.toString());
    }
  }

  Future<void> onImport() async {
    emit(
      state.copyWith(
        status: SettingsStatus.importInProgress,
      ),
    );
    try {
      final Uint8List? data = await _fileRepository.pick();
      if (data == null) {
        // TODO: localize this
        throw CustomException('You canceled the import.');
      }
      await _porterRepository.import(
        data: String.fromCharCodes(data),
      );
      emit(
        state.copyWith(
          status: SettingsStatus.importSuccess,
        ),
      );
    } catch (e) {
      onFailure(message: e.toString());
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
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
