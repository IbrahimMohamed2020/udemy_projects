import 'package:abdallah_mansour/shared/components/components.dart';
import 'package:abdallah_mansour/shared/cubit/cubit.dart';
import 'package:abdallah_mansour/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoneTasksScreen extends StatelessWidget {
  String name = 'Done Tasks';
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state){},
      builder: (context, state){

        var tasks = AppCubit.get(context).doneTasks;

        return tasksBuilder(
          tasks: tasks
        );
      },
    );
  }
}
