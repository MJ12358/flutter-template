part of 'welcome_bloc.dart';

sealed class WelcomeEvent extends Equatable {
  const WelcomeEvent();

  @override
  List<Object> get props => <Object>[];
}

final class WelcomeInitialized extends WelcomeEvent {
  const WelcomeInitialized();
}

final class WelcomeFailed extends WelcomeEvent {
  const WelcomeFailed({
    required this.message,
  });

  final String message;

  @override
  List<Object> get props => <Object>[
        message,
      ];
}

final class WelcomeCompleted extends WelcomeEvent {
  const WelcomeCompleted();
}
