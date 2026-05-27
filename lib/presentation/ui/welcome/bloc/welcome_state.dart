part of '../welcome.dart';

@MappableEnum()
enum WelcomeStatus {
  initial,
  loading,
  failure,
  complete,
}

@MappableClass()
final class WelcomeState with WelcomeStateMappable {
  const WelcomeState({
    this.sharedPrefs = const SharedPrefs(),
    this.status = WelcomeStatus.loading,
    this.errorMessage = '',
  });

  final SharedPrefs sharedPrefs;
  final WelcomeStatus status;
  final String errorMessage;

  WelcomeState Function(Map<String, dynamic> map) get fromMap =>
      WelcomeStateMapper.fromMap;
}
