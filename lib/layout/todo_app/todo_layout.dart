// ignore_for_file: prefer_const_constructors

import 'package:abdallah_mansour/shared/components/components.dart';
import 'package:abdallah_mansour/shared/cubit/cubit.dart';
import 'package:abdallah_mansour/shared/cubit/states.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HomeLayout extends StatelessWidget {

  var scaffoldKey = GlobalKey<ScaffoldState>();

  /// عرفنا هذا المتغير حتى نقوم بوضع التيكست فورم فيلد داخل الفورم ونعطي الفورم هذا الكي
  var formKey = GlobalKey<FormState>();


  var titleControler = TextEditingController();
  var timeControler = TextEditingController();
  var dateController = TextEditingController();

  /// قمنا بإنشاء list من نوع map حتى نقوم بوضع البيانات التي نستخرجها من الداتا بيز داخلها و map يتم تخزين العناصر داخلها بطريقة key يعني يتم إعطاء كل عنصر رقم



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      ///تعني و كنه تم حفظ AppCubit في variable .. تعني varable .
      create: (BuildContext context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates states){
          if(states is AppInsertDatabaseState){
            Navigator.pop(context);
          }
        },
        builder: (BuildContext context, AppStates states){

          /// قمن بإنشاء متغير حتى نسهل عملية الوصول
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(
                cubit.title[cubit.currentIn],
              ),
            ),
            body:  ConditionalBuilder(
              condition: states is !AppGetDatabaseLodingState,
              builder: (context) => cubit.screen[cubit.currentIn],
              fallback: (context) => Center(
                child: CircularProgressIndicator(),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (cubit.isBottomSheetShow) {
                  if (formKey.currentState!.validate()) {
                    cubit.insertToDatabase(
                        title: titleControler.text,
                        date: dateController.text,
                        time: timeControler.text
                    );
                    // insertToDatabase(
                    //   title: titleControler.text,
                    //  date: dateController.text,
                    //   time: timeControler.text,
                    // );
                    /// تستخدم من أجل إغلاق النافذة
                    //  Navigator.pop(context);
                    // setState(() {
                    //   editIcon = Icons.edit;
                    //   isBottomSheetShow = false;
                    // });
                  } else {

                  }
                } else {
                  scaffoldKey.currentState
                      ?.showBottomSheet(
                        (context) =>
                        Container(
                          color: Colors.grey[200],
                          padding: EdgeInsets.all(20),
                          child: Form(
                            key: formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                defultTextFormFiled(
                                    controller: titleControler,
                                    types: TextInputType.text,
                                    validate: (value) {
                                      if (value.isEmpty) {
                                        return 'The title must not be empty';
                                      }
                                      return null;
                                    },
                                    lable: 'Task Title',
                                    prefixIcon: Icons.title,
                                    onTap: () {

                                    }

                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                defultTextFormFiled(
                                  controller: timeControler,
                                  types: TextInputType.datetime,
                                  lable: 'Task Time',
                                  prefixIcon: Icons.watch_later_outlined,
                                  validate: (value) {
                                    if (value.isEmpty) {
                                      return 'The time must not be empty';
                                    }
                                    return null;
                                  },
                                  onTap: () {
                                    showTimePicker(
                                      context: context
                                      , initialTime: TimeOfDay.now(),
                                    ).then((value) {
                                      timeControler.text =
                                          value!.format(context).toString();
                                      print(value.format(context).toString());
                                    });
                                  },


                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                defultTextFormFiled(
                                    controller: dateController,
                                    types: TextInputType.text,
                                    lable: 'Task Date',
                                    prefixIcon: Icons.credit_card_rounded,
                                    validate: (value) {
                                      if (value.isEmpty) {
                                        return 'The date must be empty';
                                      }
                                      return null;
                                    },
                                    onTap: () {
                                      showDatePicker(context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime.parse('2025-10-10'),
                                      ).then((value) =>
                                      {
                                        dateController.text =
                                            DateFormat.yMMMEd().format(value!),
                                        print('${dateController.text}'),
                                      });
                                    }
                                ),

                              ],
                            ),
                          ),
                        ),
                    elevation: 20,

                    /// يتم تنفيذ هذا الكود عند إغلاق النافذة يدويا
                  )
                      .closed
                      .then((value) =>
                  {
                    cubit.changeBottomSheetState(
                      isShow: false,
                      icon: Icons.edit,
                    ),

                  });
                  cubit.changeBottomSheetState(
                    isShow: true,
                    icon: Icons.add,
                  );
                }

                // try{
                //   var name = await getname();
                //   print(name);
                //   print('osama');
                //   throw('لقد أخطأت !!!');
                // }catch(error){
                //   print('Error${error}');
                // }


                // getname().then((value){
                //   print(value);
                //   print('Osama');
                //   throw('This is the Error');
                // }).catchError((error){
                //   print('erroe${error.toString()}');
                // });
              },
              child: Icon(
                cubit.editIcon,
                color: Colors.white,
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(

              type: BottomNavigationBarType.fixed,
              elevation: 10,
              currentIndex: cubit.currentIn,
              onTap: (index) {
                cubit.changeIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                      Icons.menu
                  ),
                  label: 'Task',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.check_circle_outline,
                  ),
                  label: 'Done',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.archive_outlined,
                  ),
                  label: 'Archived',
                ),
              ],
            ),
          );
        },

      ),
    );


  }
}