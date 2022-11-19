// هنا قمت بإستدعاء الكونستركتور الخاص ب السوبر كلاس

// ignore_for_file: prefer_const_constructors
import 'package:abdallah_mansour/layout/news_app/cubit/states.dart';
import 'package:abdallah_mansour/modules/news_app/science/science_screen.dart';
import 'package:abdallah_mansour/modules/news_app/sports/sports_screen.dart';
import 'package:abdallah_mansour/modules/todo_app/setting/setting_screen.dart';
import 'package:abdallah_mansour/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewsState>{
  NewsCubit() : super(NewsInitialStates());

  // هنا قمت بإنشاء أوبجيكت من الكلاس
  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.business,
        ),
        label: 'Business'
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,
      ),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: 'Science',
    ),
    // BottomNavigationBarItem(
    //   icon: Icon(
    //     Icons.settings,
    //   ),
    //   label: 'Setting',
    // ),
  ];

  List<Widget> screen = [
    SportsScreen(),
    //BuisnessScreen(),
    ScienceScreen(),
    SettingScreen(),
  ];

  void changeButtomNavBar(int index){
    currentIndex = index;
    emit(NewBottomNavState());
  }

  List<dynamic> buisness = [];

  void getBuisness(){
    emit(NewsGetBusinessLoadingState());

    DioHelper.getData(
      url: 'v2/everything?',
      query: {
        'q':'tesla',
        'from':'2022-07-25',
        'sortBy':'publishedAt'
      },
    ).then((value) {
      //print(value.data.toString());
      buisness = value.data['articles'];
      print(buisness[0]['title']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> search = [];

  void getSearch(String value){

    emit(NewsGetSearchLoadingState());

        search = [];

        DioHelper.getData(
            url: 'v2/everything',
            query: {
              'q': '$value',
            },
        ).then((value) {
            search = value.data['articles'];
          print(search[0]['title']);
          emit(NewsGetSearchSuccessState());
        }).catchError((error){
          print(error.toString());
          emit(NewsGetSearchErrorState(error));
        });



    
  }


}





