part of 'app_bloc.dart';

sealed class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => <Object>[];
}

final class AppInitialized extends AppEvent {
  const AppInitialized();
}

final class AppFailed extends AppEvent {
  const AppFailed({
    required this.message,
  });

  final String message;

  @override
  List<Object> get props => <Object>[
        message,
      ];
}

final class AppSettingsChanged extends AppEvent {
  const AppSettingsChanged({
    required this.settings,
  });

  final Settings settings;

  @override
  List<Object> get props => <Object>[
        settings,
      ];
}

final class AppTutorialCompleted extends AppEvent {
  const AppTutorialCompleted();
}
