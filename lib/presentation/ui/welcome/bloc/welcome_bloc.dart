part of '../welcome.dart';

class WelcomeBloc extends Cubit<WelcomeState> {
  WelcomeBloc({
    required this._sharedPrefsRepository,
  }) : super(const WelcomeState());

  final SharedPrefsRepository _sharedPrefsRepository;

  Future<void> onInit() async {
    try {
      emit(
        state.copyWith(
          sharedPrefs: await _sharedPrefsRepository.get().first,
          status: WelcomeStatus.initial,
        ),
      );
    } catch (e) {
      _onFailure(e);
    }
  }

  Future<void> onComplete() async {
    try {
      await _sharedPrefsRepository.set(
        state.sharedPrefs.copyWith(
          app: state.sharedPrefs.app.copyWith(needsWelcome: false),
        ),
      );
      _onComplete();
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
          status: WelcomeStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  void _onComplete() {
    if (!isClosed) {
      emit(
        state.copyWith(
          status: WelcomeStatus.complete,
        ),
      );
    }
  }

  void _onInitial() {
    if (!isClosed) {
      emit(
        state.copyWith(
          status: WelcomeStatus.initial,
        ),
      );
    }
  }
}
