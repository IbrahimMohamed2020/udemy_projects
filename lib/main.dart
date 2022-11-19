import 'package:abdallah_mansour/layout/news_app/cubit/cubit.dart';
import 'package:abdallah_mansour/layout/soical_app/social_layout.dart';
import 'package:abdallah_mansour/layout/todo_app/todo_layout.dart';
import 'package:abdallah_mansour/modules/social_app/social_login_screen/cubit/cubit.dart';
import 'package:abdallah_mansour/modules/social_app/social_login_screen/social_login_screen.dart';
import 'package:abdallah_mansour/modules/social_app/social_register_screen/cubit/cubit.dart';
import 'package:abdallah_mansour/shared/bloc_observer.dart';
import 'package:abdallah_mansour/shared/cubit/cubit.dart';
import 'package:abdallah_mansour/shared/cubit/states.dart';
import 'package:abdallah_mansour/shared/network/local/cache_helper.dart';
import 'package:abdallah_mansour/shared/network/remote/dio_helper.dart';
import 'package:abdallah_mansour/shared/style/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() async {
  /// هذه الميثود نستخدمها عندما تكون main async  حتى تضمن تنفيذ هذه الأشياء ثم بعد ذللك تعمل run
  WidgetsFlutterBinding.ensureInitialized();
  /// نقوم بإستدعاء firebase
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver() as BlocObserver;
  DioHelper.init();

  /// علشانها async قمنا بوضع awaits
  await CacheHelper.init();

  bool? isDark = CacheHelper.getBool(key: 'isDark');

  Widget widget;


  var uId = CacheHelper.getBool(key: 'uId');

  if(uId != null){
    widget = SocialLayout();
  }else{
    widget = SocialLoginScreen();
  }

  runApp(MyApp(
    isDark: true,
    startWidget: widget,
  ),
  );
}

class MyApp extends StatelessWidget {
  final bool isDark;
  final Widget startWidget;
  MyApp({required this.isDark, required this.startWidget});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    /// لمن نستخدم أكثر من cubit في نفس التطبيق نستخدم MultiBlocProvider في main ونكتفي ب BlocConsumer في الأماكن التي نريد أن نستخدم فيه cubit

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NewsCubit()..getBuisness()),
        BlocProvider(create: (BuildContext context) => AppCubit()),
        BlocProvider(create: (BuildContext context) => SocialLoginCubit()),
        BlocProvider(create: (BuildContext context) => SocialRegisterCubit()),

      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,

            ///يتم كتابة كل التفاصيل الخاصة بالتطبيق داخل theme

            theme: lightTheme,

            /// لو اخترنا اللون الغامق لازم نحط اللإعدادات و لون الخلفبة داخل و هنا لا يتم تطبيقها إلا لمن نختار الوضع الغامق  darkTHEME
            darkTheme: darkTheme,

            themeMode:

                AppCubit.get(context).isDark ? ThemeMode.light : ThemeMode.dark,

            ///هنا نقوم بتحديد إتجاه التطبيق
            home: HomeLayout(),
          );
        },
      ),
    );
  }
}
