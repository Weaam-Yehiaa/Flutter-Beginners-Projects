import 'package:first_flutter_proj/shared/components/components.dart';
import 'package:first_flutter_proj/shared/components/cubit/cubit.dart';
import 'package:first_flutter_proj/shared/components/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArchivedTasksScreen extends StatelessWidget {
  const ArchivedTasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
        builder:(context,state) {
          var tasks=AppCubit.get(context).archivedTasks;
          return tasksBuilder(tasks: tasks);
        }, listener: (context,state){});
  }
}
