part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {}

// Increment Event
class CounterIncrementEvent extends CounterEvent {}

// Decrement Event
class CounterDecrementEvent extends CounterEvent {}

// Navigate Event
class CounterNavigateEvent extends CounterEvent{}