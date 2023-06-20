abstract class CounterStates{}

class CounterInitialState extends CounterStates{}

class CounterPlusState extends CounterStates{


  final int counter;
  CounterPlusState(this.counter);

}
class CounterMinState extends CounterStates{

  final int counter;
  CounterMinState(this.counter);

}