part of 'welcome_bloc.dart';

enum WelcomeStatus {
  initial,
  loading,
  success,
  failure,
  complete,
}

final class WelcomeState extends Equatable {
  const WelcomeState({
    this.settings = const Settings(),
    this.status = WelcomeStatus.loading,
    this.errorMessage = '',
  });

  final Settings settings;
  final WelcomeStatus status;
  final String errorMessage;

  @override
  List<Object> get props => <Object>[
        settings,
        status,
        errorMessage,
      ];

  WelcomeState copyWith({
    Settings? settings,
    WelcomeStatus? status,
    String? errorMessage,
  }) {
    return WelcomeState(
      settings: settings ?? this.settings,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
