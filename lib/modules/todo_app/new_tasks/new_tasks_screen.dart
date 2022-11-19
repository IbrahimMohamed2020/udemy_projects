
import 'package:abdallah_mansour/shared/components/components.dart';
import 'package:abdallah_mansour/shared/cubit/cubit.dart';
import 'package:abdallah_mansour/shared/cubit/states.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewTasksScreen extends StatelessWidget {
  String name = 'Tasks';
  @override
  Widget build(BuildContext context) {

    /// يتم إنشاء bloc provider  لمرة واحدة ويممكنا أن نعمل عنه أكثر من listen من BloConsumer في أكثر من مكان


    return BlocConsumer<AppCubit, AppStates>(
      
      listener: (context, state){},
      builder: (context, state){
        
        var tasks = AppCubit.get(context).newTasks;
         
        return tasksBuilder(
            tasks: tasks,
        );
      },
    );
  }
}
