part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent {


}


class Incerment extends CounterEvent {
  
}

class Decrement extends CounterEvent {
  
}
