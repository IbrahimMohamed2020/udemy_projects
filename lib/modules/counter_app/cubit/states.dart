abstract class CounterState{}

class CounterInitialState extends CounterState{}

class CounterPluseState extends CounterState{

  final int counter;
  CounterPluseState(this.counter);

}

class CounterMinusState extends CounterState{

  final int counter ;
  CounterMinusState(this.counter);

}

