// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(InitState()) {
    // on<CounterEvent>((event, emit) {
    // if (event is Incerment ) {
    //   emit(CounterState(count: state.count+1));

    // }
    // if (event is Decrement ) {
    //   emit(CounterState(count: state.count-1));

    // }
    // });
    on<Incerment>((event, emit) => emit(CounterState(count: state.count + 1)));
    on<Decrement>((event, emit) => emit(CounterState(count: state.count - 1)));
  }
}
