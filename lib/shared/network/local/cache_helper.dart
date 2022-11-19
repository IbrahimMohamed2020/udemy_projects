import 'package:shared_preferences/shared_preferences.dart';

/// هنا قمنا بإستخدام هذه package من أجل حفظ بعض المعلومات عند إغلاق التطبيق ويتم حفظ البيانات بداخل SharedPreferences


class CacheHelper{

  static late SharedPreferences sharedPreferences;

  /// يتم إستدعاء هذه الميثود قبل مرحلة RUN
  static init() async{
    sharedPreferences = await SharedPreferences.getInstance();
  }

  /// هنا قمنا بتخزين بعض المعلومات داخل SharedPreferences
  static Future<bool> putBool ({
    required String key,
    required bool value,
  })async{
    return await sharedPreferences.setBool(key, value);
  }

  /// هنا نقوم بإستدعاء بعض القيم التي قمنا بتخزينها داخل SharedPreferences
  static bool? getBool({
    required String key,
  }) {
    return  sharedPreferences.getBool(key);

  }


  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if(value is String) return await sharedPreferences.setString(key, value);
    if(value is int) return await sharedPreferences.setInt(key, value);
    if(value is bool) return await sharedPreferences.setBool(key, value);
    return await sharedPreferences.setDouble(key, value);


  }
}