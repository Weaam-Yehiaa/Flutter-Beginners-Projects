import 'package:bloc/bloc.dart';
import 'package:first_flutter_proj/modules/counter_app/counter/cubit/status.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterStates>{
  CounterCubit(): super(CounterInitialState());

  static CounterCubit get(context)=> BlocProvider.of(context); // de tre2t create object mn bloc
  // function btrg3 object mn al CounterCubit mo3tmd 3la context ana hab3to Lsa

  int counter =1;

  void minus()
  {
    counter--;
    emit(CounterMinState(counter)); // change status mn 5lalha
  }

  void plus()
  {
    counter++;
    emit(CounterPlusState(counter));
  }

}