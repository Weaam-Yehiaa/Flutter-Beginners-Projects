import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import 'package:first_flutter_proj/shared/components/components.dart';
import 'package:first_flutter_proj/shared/components/conestant.dart';
import 'package:first_flutter_proj/shared/components/cubit/cubit.dart';
import 'package:first_flutter_proj/shared/components/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';


class HomeLayout extends StatelessWidget{


  var scaffoldKey= GlobalKey<ScaffoldState>();
  var formKey= GlobalKey<FormState>();

  var titleController=TextEditingController();
  var timeController=TextEditingController();
  var dateController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>AppCubit()..createDatabase(),// k2ni 3mlt object AppCubit f variable w bstd3i al method mn 5lalha
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (BuildContext context,AppStates state){
          if(state is AppInsertDatabaseState)
            {
              Navigator.pop(context);
            }

        },
        builder: (BuildContext context,AppStates state){
          AppCubit cubit=AppCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              backgroundColor: Colors.purpleAccent,
              title: Text(
                cubit.titles[cubit.currentIndex],
              ),
            ),
            body:ConditionalBuilder(
              condition: true,
              builder: (context)=>cubit.screens[cubit.currentIndex],
              fallback: (context)=>Center(child: CircularProgressIndicator()),
            ) ,
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.purpleAccent,
              onPressed: () async {

                if(cubit.isBottomSheetShown)
                {
                  if(formKey.currentState!.validate())
                  {
                    cubit.insertToDatabase(title: titleController.text, time: timeController.text, date: dateController.text);


                  }
                }
                else
                {
                  scaffoldKey.currentState?.showBottomSheet(
                        (context) => Container(
                      color: Colors.white,
                      padding:EdgeInsets.all(20.0) ,
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            defaultFormField(

                              controller: titleController,
                              type: TextInputType.text,
                              validate: (String value)
                              {
                                if(value.isEmpty)
                                {
                                  return "Title must not be empty";
                                }
                              },
                              label:"Task Tilte" ,
                              prefix: Icons.title,
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            defaultFormField(
                                controller: timeController,
                                type: TextInputType.datetime,
                                onTap: (){
                                  showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now()).then((value)
                                  {
                                    timeController.text=value!.format(context).toString();
                                    print(value?.format(context));
                                  });

                                },

                                validate: (String value)
                                {
                                  if(value.isEmpty)
                                    return 'time must nor be empty';
                                  else
                                    return null;
                                },
                                label: 'Task Time',
                                prefix: Icons.watch_later_outlined
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            defaultFormField(
                                controller: dateController,
                                type: TextInputType.datetime,

                                onTap: (){
                                  showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.parse('2023-02-22')).then((value)
                                  {
                                    dateController.text=DateFormat.yMMMd().format(value!);
                                  }
                                  );

                                },

                                validate: (String value)
                                {
                                  if(value.isEmpty)
                                    return 'Date must nor be empty';
                                  else
                                    return null;
                                },
                                label: 'Task Date',
                                prefix: Icons.calendar_month
                            ),

                          ],
                        ),
                      ),
                    ),
                    elevation: 20.0,
                  ).closed.then((value) // to close bottomSheet
                  {
                    cubit.changeSheetState(isShow: false, icon: Icons.edit);


                  });
                  cubit.changeSheetState(isShow: true, icon: Icons.add);


                }
              },
              child: Icon(
                cubit.fabIcon,
              ),

            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (index){

                cubit.changeIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon:Icon(Icons.menu, color: Colors.purpleAccent,),
                  label: 'Tasks',

                ),
                BottomNavigationBarItem(
                  icon:Icon(Icons.check, color: Colors.purpleAccent,),
                  label: 'Done',
                ),
                BottomNavigationBarItem(
                  icon:Icon(Icons.archive, color: Colors.purpleAccent,),
                  label: 'Archive',
                ),

              ],
            ),
          );
        },
      ),


    );
  }


}

