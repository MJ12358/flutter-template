part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => <Object>[];
}

class AppInitialized extends AppEvent {
  const AppInitialized();
}

class AppFailed extends AppEvent {
  const AppFailed({
    required this.message,
  });

  final String message;

  @override
  List<Object> get props => <Object>[
        message,
      ];
}

class AppSettingsChanged extends AppEvent {
  const AppSettingsChanged({
    required this.settings,
  });

  final Settings settings;

  @override
  List<Object> get props => <Object>[
        settings,
      ];
}

class AppTutorialCompleted extends AppEvent {
  const AppTutorialCompleted();
}
