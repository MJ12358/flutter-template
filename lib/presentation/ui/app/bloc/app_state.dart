part of '../app.dart';

@MappableEnum()
enum AppStatus {
  initializing,
  needsWelcome,
  success,
  failure,
  reset,
}

@MappableClass()
final class AppState with AppStateMappable {
  const AppState({
    this.settings = const Settings(),
    this.sharedPrefs = const SharedPrefs(),
    this.status = AppStatus.initializing,
    this.errorMessage = '',
  });

  final Settings settings;
  final SharedPrefs sharedPrefs;
  final AppStatus status;
  final String errorMessage;

  AppState Function(Map<String, dynamic> map) get fromMap =>
      AppStateMapper.fromMap;
}
