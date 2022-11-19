import 'package:abdallah_mansour/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:abdallah_mansour/modules/todo_app/archived_tasks/archived_tasks_screen.dart';
import 'package:abdallah_mansour/modules/todo_app/done_tasks/done_tasks.dart';
import 'package:abdallah_mansour/modules/todo_app/new_tasks/new_tasks_screen.dart';
import 'package:abdallah_mansour/shared/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  late Database database;
  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archivedTasks = [];



  int currentIn = 0;
  List<Widget> screen = [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
  ];

  List<String> title = [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',
  ];

  void changeIndex(int index) {
    this.currentIn = index;

    /// تستخدم من أجل تغيير الستستس
    emit(AppChangeBottomNavBarState());
  }


  /// يتم كتابة async مع الميثود التي تقوم بشيء خارجي يعني تتعامل مع شيء خارج الكلاس
  Future <String> getname() async {
    return "Ibarhim mohamed";
  }

  void createDatabase() {
    /// يتم استخدام await مع الأشياء التي تأتي من خارج الكلاس يعني حركة بيانات خارجية وبالتالي نكتب await وتعني غنتظر البيانات حتى لو تأخرت
    openDatabase(
        'todo.db',
        version: 1,

        onCreate: (database, version) {
          print('database created');

          /// هنا استخدمنا then حتى يتم الطباعة بعد إنشاء الداتا بيز يعني ختى يتم التاكد بأن الداتا بيز قد أنشأت

          database.execute(
              'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)')
              .then((value) {
            print('Table created');
          }).catchError((error) {
            print('لقد حدث خطأ ما !!!');
          });
        },

        onOpen: (database) {
          getDataFromDataBase(database);
          print('database opened');
        }
    ).then((value)
    {
      database = value;
      emit(AppCreateDatabaseState());
    });
  }


  /// تستخدم هذه الميثود لإضافة العناصر إلى قاعدة البانات و ذلك من خلال ميثود إسمها transaction ومن ثم rawInsert
  Future insertToDatabase({
    required String title,
    required String date,
    required String time,
  }) {
    return database.transaction((txn) async {
      txn.rawInsert(
          'INSERT INTO tasks(title, date, time, status) VALUES ("$title", "$date", "$time", "new")'
      ).then((value) {
        print('$value inserted successfuly');
        emit(AppInsertDatabaseState());

        getDataFromDataBase(database);
      }).catchError((error) {
        print('Error when Inserting New Record ${error.toString()}');
      });
    });
  }

  /// تم تعريف الميثود على أنها future و نوع البيانات التي ترجعها من نوع listMap حتى تكون في يدي وأقوم بإجراء ما أريد عليها
  Future getDataFromDataBase(database) async {

    newTasks  =[];
    doneTasks = [];
    archivedTasks = [];

    emit(AppGetDatabaseLodingState());
    database.rawQuery("SELECT * FROM tasks").then((value)  {

      value.forEach((element) {
        if(element['status'] == 'new'){
          newTasks.add(element);
        }else if (element['status'] == 'done'){
          doneTasks.add(element);
        }else{
          archivedTasks.add(element);
        }
      });

      emit(AppGetDatabaseState());

    });
  }


  void updateData({
    required String status,
    required int id,
  }) async {
    database.rawUpdate(
      'UPDATE tasks SET status = ? WHERE id = ?',
      [status, id],
    ).then((value){
      getDataFromDataBase(database);
      emit(AppUpdateDatabaseState());
    });
  }


  void deletData({
  required int id,
}) async {
    database.rawDelete(
        'DELETE FROM tasks WHERE id = ?',
        [id],
    );
    getDataFromDataBase(database);
    emit(AppDeleteDatabaseState());
  }





  bool isBottomSheetShow = false;
  IconData editIcon = Icons.edit;

  void changeBottomSheetState({
    required bool isShow,
    required IconData icon,
  })
  {
    isBottomSheetShow = isShow;
    editIcon = icon;
    emit(AppChangeBottomSheetState());

  }

  bool isDark  = true;

  void changeMode(){
    isDark = !isDark;
    CacheHelper.putBool(key: 'is dark', value: isDark).then((value) => {
      emit(AppChangeModeState()),
    });
  }

}
