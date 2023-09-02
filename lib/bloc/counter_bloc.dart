import 'package:bloc_counter/bloc/bloc_event.dart';
import 'package:bloc_counter/bloc/bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(InitialState()) {
    on<Increment>((event, emit) {
      emit(CounterState(counter: state.counter + 1));
    });

    on<Decrement>((event, emit) {
      emit(CounterState(counter: state.counter - 1));
    });

    on<CheckNegativeNumb>((event, emit) {
      emit(CounterState(counter: state.counter <= 0 ? 0 : state.counter));
    });
  }
}
