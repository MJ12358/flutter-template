import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_template/domain/entities/settings.dart';
import 'package:flutter_template/domain/usecases/porter/export_usecase.dart';
import 'package:flutter_template/domain/usecases/porter/import_usecase.dart';
import 'package:flutter_template/domain/usecases/settings/get_settings_usecase.dart';
import 'package:flutter_template/domain/usecases/settings/set_settings_usecase.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc({
    required GetSettingsUseCase getSettingsUseCase,
    required SetSettingsUseCase setSettingsUseCase,
    required ExportUseCase exportUseCase,
    required ImportUseCase importUseCase,
  })  : _getSettingsUseCase = getSettingsUseCase,
        _setSettingsUseCase = setSettingsUseCase,
        _exportUseCase = exportUseCase,
        _importUseCase = importUseCase,
        super(const SettingsState()) {
    on<SettingsInitialized>(_onInit);
    on<SettingsFailed>(_onFailure);
    on<SettingsChanged>(_onChanged);
    on<SettingsDarkModeChanged>(_onDarkModeChanged);
    on<SettingsPrimaryColorChanged>(_onPrimaryColorChanged);
    on<SettingsSecondaryColorChanged>(_onSecondaryColorChanged);
    on<SettingsMaterialGridChanged>(_onMaterialGridChanged);
    on<SettingsPerformanceOverlayChanged>(_onPerformanceOverlayChanged);
    on<SettingsImmersiveModeChanged>(_onImmersiveModeChanged);
    on<SettingsSemanticOverlayChanged>(_onSemanticOverlayChanged);
    on<SettingsAnalyticsChanged>(_onAnalyticsChanged);
    on<SettingsExportPressed>(_onExport);
    on<SettingsImportPressed>(_onImport);
  }

  final GetSettingsUseCase _getSettingsUseCase;
  final SetSettingsUseCase _setSettingsUseCase;
  final ExportUseCase _exportUseCase;
  final ImportUseCase _importUseCase;
  StreamSubscription<Settings>? _streamSubscription;

  Future<void> _onInit(
    SettingsInitialized event,
    Emitter<SettingsState> emit,
  ) async {
    final GetSettingsResult result =
        await _getSettingsUseCase(const GetSettingsParams());

    if (result.hasError) {
      add(SettingsFailed(message: result.errorMessage!));
    } else {
      _streamSubscription = result.value?.listen((Settings data) {
        add(SettingsChanged(settings: data));
      });
    }
  }

  void _onFailure(
    SettingsFailed event,
    Emitter<SettingsState> emit,
  ) {
    emit(
      state.copyWith(
        status: SettingsStatus.failure,
        errorMessage: event.message,
      ),
    );
  }

  void _onChanged(
    SettingsChanged event,
    Emitter<SettingsState> emit,
  ) {
    emit(
      state.copyWith(
        status: SettingsStatus.success,
        settings: event.settings,
      ),
    );
  }

  Future<void> _onDarkModeChanged(
    SettingsDarkModeChanged event,
    Emitter<SettingsState> emit,
  ) async {
    final SetSettingsResult result = await _setSettingsUseCase(
      SetSettingsParams(
        settings: state.settings.copyWith(
          darkMode: event.darkMode,
        ),
      ),
    );

    if (result.hasError) {
      add(SettingsFailed(message: result.errorMessage!));
    }
  }

  Future<void> _onPrimaryColorChanged(
    SettingsPrimaryColorChanged event,
    Emitter<SettingsState> emit,
  ) async {
    final SetSettingsResult result = await _setSettingsUseCase(
      SetSettingsParams(
        settings: state.settings.copyWith(
          primaryColor: event.color,
        ),
      ),
    );

    if (result.hasError) {
      add(SettingsFailed(message: result.errorMessage!));
    }
  }

  Future<void> _onSecondaryColorChanged(
    SettingsSecondaryColorChanged event,
    Emitter<SettingsState> emit,
  ) async {
    final SetSettingsResult result = await _setSettingsUseCase(
      SetSettingsParams(
        settings: state.settings.copyWith(
          secondaryColor: event.color,
        ),
      ),
    );

    if (result.hasError) {
      add(SettingsFailed(message: result.errorMessage!));
    }
  }

  Future<void> _onMaterialGridChanged(
    SettingsMaterialGridChanged event,
    Emitter<SettingsState> emit,
  ) async {
    final SetSettingsResult result = await _setSettingsUseCase(
      SetSettingsParams(
        settings: state.settings.copyWith(
          showMaterialGrid: event.showMaterialGrid,
        ),
      ),
    );

    if (result.hasError) {
      add(SettingsFailed(message: result.errorMessage!));
    }
  }

  Future<void> _onPerformanceOverlayChanged(
    SettingsPerformanceOverlayChanged event,
    Emitter<SettingsState> emit,
  ) async {
    final SetSettingsResult result = await _setSettingsUseCase(
      SetSettingsParams(
        settings: state.settings.copyWith(
          showPerformanceOverlay: event.showPerformanceOverlay,
        ),
      ),
    );

    if (result.hasError) {
      add(SettingsFailed(message: result.errorMessage!));
    }
  }

  Future<void> _onImmersiveModeChanged(
    SettingsImmersiveModeChanged event,
    Emitter<SettingsState> emit,
  ) async {
    final SetSettingsResult result = await _setSettingsUseCase(
      SetSettingsParams(
        settings: state.settings.copyWith(
          immersiveMode: event.immersiveMode,
        ),
      ),
    );

    if (result.hasError) {
      add(SettingsFailed(message: result.errorMessage!));
    }
  }

  Future<void> _onSemanticOverlayChanged(
    SettingsSemanticOverlayChanged event,
    Emitter<SettingsState> emit,
  ) async {
    final SetSettingsResult result = await _setSettingsUseCase(
      SetSettingsParams(
        settings: state.settings.copyWith(
          showSemanticOverlay: event.showSemanticOverlay,
        ),
      ),
    );

    if (result.hasError) {
      add(SettingsFailed(message: result.errorMessage!));
    }
  }

  Future<void> _onAnalyticsChanged(
    SettingsAnalyticsChanged event,
    Emitter<SettingsState> emit,
  ) async {
    final SetSettingsResult result = await _setSettingsUseCase(
      SetSettingsParams(
        settings: state.settings.copyWith(
          analytics: event.analytics,
        ),
      ),
    );

    if (result.hasError) {
      add(SettingsFailed(message: result.errorMessage!));
    }
  }

  Future<void> _onExport(
    SettingsExportPressed event,
    Emitter<SettingsState> emit,
  ) async {
    emit(
      state.copyWith(
        status: SettingsStatus.exportInProgress,
      ),
    );

    final ExportResult result = await _exportUseCase(const ExportParams());

    if (result.hasError) {
      add(SettingsFailed(message: result.errorMessage!));
    } else {
      emit(
        state.copyWith(
          status: SettingsStatus.exportSuccess,
        ),
      );
    }
  }

  Future<void> _onImport(
    SettingsImportPressed event,
    Emitter<SettingsState> emit,
  ) async {
    emit(
      state.copyWith(
        status: SettingsStatus.importInProgress,
      ),
    );

    final ImportResult result = await _importUseCase(const ImportParams());

    if (result.hasError) {
      add(SettingsFailed(message: result.errorMessage!));
    } else {
      emit(
        state.copyWith(
          status: SettingsStatus.importSuccess,
        ),
      );
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
