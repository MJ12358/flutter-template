part of 'settings_bloc.dart';

enum SettingsStatus {
  loading,
  initial,
  success,
  failure,
  exportInProgress,
  exportSuccess,
  importInProgress,
  importSuccess,
}

class SettingsState extends Equatable {
  const SettingsState({
    this.settings = const Settings(),
    this.status = SettingsStatus.loading,
    this.errorMessage = '',
  });

  final Settings settings;
  final SettingsStatus status;
  final String errorMessage;

  @override
  List<Object> get props => <Object>[
        settings,
        status,
        errorMessage,
      ];

  SettingsState copyWith({
    Settings? settings,
    SettingsStatus? status,
    String? errorMessage,
  }) {
    return SettingsState(
      settings: settings ?? this.settings,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
