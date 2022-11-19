import 'package:abdallah_mansour/layout/news_app/cubit/cubit.dart';
import 'package:abdallah_mansour/layout/news_app/cubit/states.dart';
import 'package:abdallah_mansour/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  var searchControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;

        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: defultTextFormFiled(
                  controller: searchControler,
                  types: TextInputType.text,
                  lable: 'Search',
                  prefixIcon: Icons.search,
                  onChange: (value){
                    NewsCubit.get(context).getSearch(value);
                  },
                  validate: (String value){
                    if(value.isEmpty){
                      return('search must not be empty');
                    }
                    return null;
                  },
                ),
              ),
             // buildTaskItem(model, context),

            ],
          ),
        );
      },
    );

  }
}
