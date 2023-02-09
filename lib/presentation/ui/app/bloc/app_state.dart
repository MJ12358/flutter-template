part of 'app_bloc.dart';

enum AppStatus {
  loading,
  initial,
  success,
  failure,
  authenticated,
  unauthenticated,
}

class AppState extends Equatable {
  const AppState({
    this.status = AppStatus.loading,
    this.errorMessage = '',
  });

  final AppStatus status;
  final String errorMessage;

  @override
  List<Object> get props => <Object>[
        status,
        errorMessage,
      ];

  AppState copyWith({
    AppStatus? status,
    String? errorMessage,
  }) {
    return AppState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
