part of '../settings.dart';

@MappableEnum()
enum SettingsStatus {
  loading,
  initial,
  success,
  failure,
}

@MappableClass()
final class SettingsState with SettingsStateMappable {
  const SettingsState({
    this.settings = const Settings(),
    this.sharedPrefs = const SharedPrefs(),
    this.status = SettingsStatus.loading,
    this.errorMessage = '',
  });

  final Settings settings;
  final SharedPrefs sharedPrefs;
  final SettingsStatus status;
  final String errorMessage;

  SettingsState Function(Map<String, dynamic> map) get fromMap =>
      SettingsStateMapper.fromMap;
}
