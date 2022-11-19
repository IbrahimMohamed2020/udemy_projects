// ignore_for_file: prefer_const_constructors

import 'package:abdallah_mansour/layout/news_app/cubit/cubit.dart';
import 'package:abdallah_mansour/layout/news_app/cubit/states.dart';
import 'package:abdallah_mansour/modules/news_app/search/search_screen.dart';
import 'package:abdallah_mansour/shared/components/components.dart';
import 'package:abdallah_mansour/shared/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsLayout extends StatelessWidget {

  const NewsLayout({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()..getBuisness(),
      child:BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state){},
        builder: (context, state){
          var cubit = NewsCubit.get(context);
          return  Scaffold(
            appBar: AppBar(
              title: Text('News App'),
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.search,
                  ),
                  onPressed: (){
                    navigatTo(
                      context,
                      SearchScreen(),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.brightness_4_outlined,
                  ),
                  onPressed:() {
                  //  AppCubit.get(context).changeMode();
                  },
                ),
              ],

            ),
            body: cubit.screen[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              items: cubit.bottomItems,
              onTap: (index){
                cubit.changeButtomNavBar(index);
              },
            ),
          );
        },
      ),
    );
  }
}
