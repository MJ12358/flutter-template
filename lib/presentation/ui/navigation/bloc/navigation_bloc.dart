part of '../navigation.dart';

class NavigationBloc extends Cubit<NavigationState> {
  NavigationBloc._({
    required this._sharedPrefsRepository,
    required NavigationState initialState,
  })  : super(initialState);

  final SharedPrefsRepository _sharedPrefsRepository;

  static Future<NavigationBloc> create({
    required SharedPrefsRepository sharedPrefsRepository,
  }) async {
    final SharedPrefs sharedPrefs = await sharedPrefsRepository.get().first;
    final int navIndex = sharedPrefs.navigation.index;
    return NavigationBloc._(
      sharedPrefsRepository: sharedPrefsRepository,
      initialState: NavigationState(
        // always start with history(0) in the stack
        stack: navIndex == 0 ? <int>[0] : <int>[0, navIndex],
      ),
    );
  }

  Future<void> push(int index) async {
    if (state.index == index) {
      _onScrollTop(index);
      return;
    }
    final List<int> newStack = List<int>.from(state.stack);
    if (index == 0) {
      // When navigating to home, move it to the end but keep other tabs
      newStack.remove(0);
      newStack.add(0);
    } else {
      // For other tabs
      newStack.remove(index);
      newStack.add(index);
    }
    final NavigationState newState = state.copyWith(stack: newStack);
    emit(newState);
    await _persist(newState);
  }

  void pop() {
    if (!state.canPop) {
      return;
    }
    final List<int> newStack = List<int>.from(state.stack)..removeLast();
    final NavigationState newState = state.copyWith(stack: newStack);
    emit(newState);
    _persist(newState);
  }

  Future<void> reset() async {
    final NavigationState newState = NavigationState(
      stack: <int>[0],
      revision: state.revision + 1,
    );
    emit(newState);
    await _persist(newState);
  }

  void _onScrollTop(int index) {
    emit(
      state.copyWith(
        scrollEvent: Object(),
        scrollTarget: NavigationItem.values[index],
      ),
    );
  }

  Future<void> _persist(NavigationState state) async {
    final SharedPrefs prefs = await _sharedPrefsRepository.get().first;
    if (state.index == prefs.navigation.index) {
      return;
    }
    await _sharedPrefsRepository.set(
      prefs.copyWith(
        navigation: prefs.navigation.copyWith(
          index: state.index,
        ),
      ),
    );
  }
}
