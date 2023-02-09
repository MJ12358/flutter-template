import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_template/domain/entities/settings.dart';
import 'package:flutter_template/domain/usecases/settings/get_settings_usecase.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({
    required GetSettingsUseCase getSettingsUseCase,
  })  : _getSettingsUseCase = getSettingsUseCase,
        super(const AppState()) {
    on<AppInitialized>(_onInit);
    on<AppFailure>(_onFailure);
    on<AppSettingsChanged>(_onSettingsChanged);
  }

  final GetSettingsUseCase _getSettingsUseCase;
  StreamSubscription<Settings>? _settingsSubscription;

  Future<void> _onInit(
    AppInitialized event,
    Emitter<AppState> emit,
  ) async {
    final GetSettingsResult settingsResult =
        await _getSettingsUseCase(const GetSettingsParams());

    if (settingsResult.hasError) {
      add(AppFailure(message: settingsResult.errorMessage!));
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
    AppFailure event,
    Emitter<AppState> emit,
  ) {
    emit(
      state.copyWith(
        status: AppStatus.failure,
        errorMessage: event.message,
      ),
    );
  }

  void _onSettingsChanged(
    AppSettingsChanged event,
    Emitter<AppState> emit,
  ) {
    emit(
      state.copyWith(
        settings: event.settings,
      ),
    );
  }

  @override
  Future<void> close() {
    _settingsSubscription?.cancel();
    return super.close();
  }
}
