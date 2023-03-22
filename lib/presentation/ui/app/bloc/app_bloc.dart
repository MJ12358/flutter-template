import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_template/domain/entities/settings.dart';
import 'package:flutter_template/domain/usecases/settings/get_settings_usecase.dart';
import 'package:flutter_template/domain/usecases/settings/set_settings_usecase.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({
    required GetSettingsUseCase getSettingsUseCase,
    required SetSettingsUseCase setSettingsUseCase,
  })  : _getSettingsUseCase = getSettingsUseCase,
        _setSettingsUseCase = setSettingsUseCase,
        super(const AppState()) {
    on<AppInitialized>(_onInit);
    on<AppFailed>(_onFailure);
    on<AppSettingsChanged>(_onSettingsChange);
    on<AppTutorialCompleted>(_onTutorialComplete);
  }

  final GetSettingsUseCase _getSettingsUseCase;
  final SetSettingsUseCase _setSettingsUseCase;
  StreamSubscription<Settings>? _settingsSubscription;

  Future<void> _onInit(
    AppInitialized event,
    Emitter<AppState> emit,
  ) async {
    final GetSettingsResult settingsResult =
        await _getSettingsUseCase(const GetSettingsParams());

    if (settingsResult.hasError) {
      add(AppFailed(message: settingsResult.errorMessage!));
    } else {
      _settingsSubscription = settingsResult.value?.listen((Settings data) {
        add(AppSettingsChanged(settings: data));
      });
      emit(
        state.copyWith(
          status: AppStatus.initial,
        ),
      );
    }
  }

  void _onFailure(
    AppFailed event,
    Emitter<AppState> emit,
  ) {
    emit(
      state.copyWith(
        status: AppStatus.failure,
        errorMessage: event.message,
      ),
    );
  }

  void _onSettingsChange(
    AppSettingsChanged event,
    Emitter<AppState> emit,
  ) {
    emit(
      state.copyWith(
        settings: event.settings,
      ),
    );
  }

  Future<void> _onTutorialComplete(
    AppTutorialCompleted event,
    Emitter<AppState> emit,
  ) async {
    final SetSettingsResult result = await _setSettingsUseCase(
      SetSettingsParams(
        settings: state.settings.copyWith(
          needsTutorial: false,
        ),
      ),
    );

    if (result.hasError) {
      add(AppFailed(message: result.errorMessage!));
    }
  }

  @override
  Future<void> close() {
    _settingsSubscription?.cancel();
    return super.close();
  }
}
