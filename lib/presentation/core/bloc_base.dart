import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BlocBase<Event, State> implements Bloc<Event, State> {
  // BlocBase() : super(StateBase.new);
  const BlocBase();

  // @override
  // void onError() {
  //   super.onError();
  // }
}

abstract class StateBase extends Equatable {
  const StateBase();

  @override
  List<Object?> get props => <Object?>[];

  StateBase copyWith();
}

abstract class EventBase extends Equatable {
  const EventBase();

  @override
  List<Object?> get props => <Object?>[];
}
