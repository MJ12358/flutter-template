part of '../navigation.dart';

@MappableClass()
final class NavigationState with NavigationStateMappable {
  const NavigationState({
    this.stack = const <int>[0],
    this.revision = 0,
    this.scrollEvent,
    this.scrollTarget,
  });

  final List<int> stack;
  final int revision;
  final Object? scrollEvent;
  final NavigationItem? scrollTarget;

  int get index => stack.isEmpty ? 0 : stack.last;
  bool get canPop =>
      stack.length > 1 || (stack.length == 1 && stack.first != 0);

  NavigationState Function(Map<String, dynamic> map) get fromMap =>
      NavigationStateMapper.fromMap;
}
