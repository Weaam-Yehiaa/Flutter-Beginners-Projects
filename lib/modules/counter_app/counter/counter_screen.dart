
import 'package:first_flutter_proj/modules/counter_app/counter/cubit/cubit.dart';
import 'package:first_flutter_proj/modules/counter_app/counter/cubit/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>CounterCubit(),
      child: BlocConsumer<CounterCubit,CounterStates>(
        listener: (context,state){
          if(state is CounterPlusState)
            {
              print('plus state ${state.counter}');
            }
          if(state is CounterMinState)
          {
            print('minus state ${state.counter}');
          }

        },
        builder: (context,state){
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.purpleAccent,
              title: Text(
                'Counter',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),

              ),
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: (){
                      CounterCubit.get(context).minus();
                    },
                    child: Text(
                      'MUNIS',
                      style: TextStyle(fontSize: 20.0),
                    ),

                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0
                    ),
                    child: Text(
                      '${CounterCubit.get(context).counter}',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: (){
                      CounterCubit.get(context).plus();
                    },
                    child: Text(
                      'PLUS',
                      style: TextStyle(fontSize: 20.0),
                    ),

                  ),
                ],
              ),
            ) ,
          );
        },
      ),
    );
  }
}

