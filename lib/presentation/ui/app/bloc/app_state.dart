part of '../app.dart';

enum AppStatus {
  initializing,
  initial,
  success,
  failure,
  authenticated,
  unauthenticated,
  needsWelcome,
}

final class AppState extends Equatable {
  const AppState({
    this.settings = const Settings(),
    this.status = AppStatus.initializing,
    this.errorMessage = '',
  });

  final Settings settings;
  final AppStatus status;
  final String errorMessage;

  @override
  List<Object> get props => <Object>[
        settings,
        status,
        errorMessage,
      ];

  AppState copyWith({
    Settings? settings,
    AppStatus? status,
    String? errorMessage,
  }) {
    return AppState(
      settings: settings ?? this.settings,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
