import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState()) {
    on<AppInitialized>(_onInit);
  }

  Future<void> _onInit(
    AppInitialized event,
    Emitter<AppState> emit,
  ) async {
    emit(
      state.copyWith(
        status: AppStatus.initial,
      ),
    );
  }
}
