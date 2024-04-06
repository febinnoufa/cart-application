part of 'counter_bloc.dart';

class CounterState {
  final int count;

  CounterState({required this.count});
}

class InitState extends CounterState {
  InitState() : super(count: 0);
}
