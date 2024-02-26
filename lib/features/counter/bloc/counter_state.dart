part of 'counter_bloc.dart';

@immutable
abstract class CounterState {}

// Action State
abstract class CounterActionState extends CounterState {}

class CounterInitial extends CounterState {}

// Increment State
class CounterIncrementActionState extends CounterActionState {}

// Decrement State
class CounterDecrementActionState extends CounterActionState {}

// Navigate State
class CounterNavigateActionState extends CounterActionState {}