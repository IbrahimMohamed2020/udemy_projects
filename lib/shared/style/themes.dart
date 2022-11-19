// ignore_for_file: prefer_const_constructors

import 'package:abdallah_mansour/shared/components/constance.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

/// في هذا الملف نقوم بوضع جميع الإعدادات الخاصة بمظهر التطبيق


ThemeData darkTheme = ThemeData(
  primarySwatch: defultColor,
  fontFamily: 'fontFamily1',
  appBarTheme: AppBarTheme(
    titleSpacing: 20,
    ///هنا نقوم بتغيير إعدادات status appBar و أول خطوة نقوم بوضع false حتى نستطيع نغيير الإعدادات
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(

      ///هنا قمت بتغيير لون status appBar
      statusBarColor: HexColor('333739'),

      /// هنا قمت بتغيير لون الأيقونات الموجودة داخل status appBar
      statusBarIconBrightness: Brightness.light,

    ),
    color: HexColor('333739'),
    elevation: 0,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),

    ///هنا التفاصيل الخاصة بالأيقونات الموجودة داخل appBar
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  scaffoldBackgroundColor: HexColor('333739'),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w600,

    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: HexColor('333739'),

    /// هنا نقوم بجعل الشريط السفلي متناسق مع الشاشة
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.green,
    unselectedItemColor: Colors.grey,

  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    elevation: 0,
    backgroundColor: Colors.cyan,
  ),
);

ThemeData lightTheme =  ThemeData(
  fontFamily: 'fontFamily1',


  /// هنا نعطي لون لكل الاشياء الموجودة في التطبيق
  primarySwatch: defultColor,

  /// هنا التفاصيل الخاصة ب appBar
  appBarTheme: AppBarTheme(

    /// المسافة التي تكون حول العنوان
    titleSpacing: 20,
    ///هنا نقوم بتغيير إعدادات status appBar و أول خطوة نقوم بوضع false حتى نستطيع نغيير الإعدادات
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(

      ///هنا قمت بتغيير لون status appBar
      statusBarColor: Colors.white,

      /// هنا قمت بتغيير لون الأيقونات الموجودة داخل status appBar
      statusBarIconBrightness: Brightness.dark,
    ),
    color: Colors.white,
    elevation: 0,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),

    ///هنا التفاصيل الخاصة بالأيقونات الموجودة داخل appBar
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),

  scaffoldBackgroundColor: Colors.white,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(

    /// هنا نقوم بجعل الشريط السفلي متناسق مع الشاشة
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.cyan,
    unselectedItemColor: Colors.black.withOpacity(0.6),

  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    elevation: 0,
    backgroundColor: Colors.cyan,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.w600,

    ),
  ),

);