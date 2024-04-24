import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_template/domain/entities/settings.dart';
import 'package:flutter_template/domain/usecases/settings/get_settings_usecase.dart';
import 'package:flutter_template/domain/usecases/settings/set_settings_usecase.dart';

part 'welcome_event.dart';
part 'welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc({
    required GetSettingsUseCase getSettingsUseCase,
    required SetSettingsUseCase setSettingsUseCase,
  })  : _getSettingsUseCase = getSettingsUseCase,
        _setSettingsUseCase = setSettingsUseCase,
        super(const WelcomeState()) {
    on<WelcomeInitialized>(_onInit);
    on<WelcomeFailed>(_onFailure);
    on<WelcomeCompleted>(_onComplete);
  }

  final GetSettingsUseCase _getSettingsUseCase;
  final SetSettingsUseCase _setSettingsUseCase;

  Future<void> _onInit(
    WelcomeInitialized event,
    Emitter<WelcomeState> emit,
  ) async {
    final GetSettingsResult result =
        await _getSettingsUseCase(const GetSettingsParams());

    if (result.hasError) {
      add(WelcomeFailed(message: result.errorMessage!));
      return;
    }

    final Settings? settings = await result.value?.first;

    emit(
      state.copyWith(
        status: WelcomeStatus.initial,
        settings: settings,
      ),
    );
  }

  void _onFailure(
    WelcomeFailed event,
    Emitter<WelcomeState> emit,
  ) {
    emit(
      state.copyWith(
        status: WelcomeStatus.failure,
        errorMessage: event.message,
      ),
    );
  }

  Future<void> _onComplete(
    WelcomeCompleted event,
    Emitter<WelcomeState> emit,
  ) async {
    final SetSettingsResult result = await _setSettingsUseCase(
      SetSettingsParams(
        settings: state.settings.copyWith(
          needsWelcome: false,
        ),
      ),
    );

    if (result.hasError) {
      add(WelcomeFailed(message: result.errorMessage!));
      return;
    }

    emit(
      state.copyWith(
        status: WelcomeStatus.complete,
      ),
    );
  }
}
