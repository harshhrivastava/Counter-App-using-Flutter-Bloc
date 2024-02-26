import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<CounterNavigateEvent>(onCounterNavigateEvent);
    on<CounterIncrementEvent>(onCounterIncrementEvent);
    on<CounterDecrementEvent>(onCounterDecrementEvent);
  }

  int count = 0;

  void onCounterNavigateEvent(
    CounterNavigateEvent event, Emitter<CounterState> emit
  ) {
    emit(CounterNavigateActionState());
  }

  void onCounterIncrementEvent(
    CounterIncrementEvent event, Emitter<CounterState> emit
  ) {
    count++;
    emit(CounterIncrementActionState());
  }

  void onCounterDecrementEvent(
    CounterDecrementEvent event, Emitter<CounterState> emit
  ) {
    count--;
    emit(CounterDecrementActionState());
  }
}
