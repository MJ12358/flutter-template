part of 'welcome_bloc.dart';

abstract class WelcomeEvent extends Equatable {
  const WelcomeEvent();

  @override
  List<Object> get props => <Object>[];
}

class WelcomeInitialized extends WelcomeEvent {
  const WelcomeInitialized();
}

class WelcomeFailed extends WelcomeEvent {
  const WelcomeFailed({
    required this.message,
  });

  final String message;

  @override
  List<Object> get props => <Object>[
        message,
      ];
}

class WelcomeCompleted extends WelcomeEvent {
  const WelcomeCompleted();
}
