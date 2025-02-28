import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class SessionData{
  static bool? isLogin;
  static String? emailId;

  static Future<void> storeSessionData(
    {required bool loginData,required String emailId})async{
      SharedPreferences sharedPreferences = await
      SharedPreferences.getInstance();
      /// SET DATA
      sharedPreferences.setBool("LoginSession", loginData);
      sharedPreferences.setString("email", emailId);
      /// GET DATA
      getSessionData();
    }
    static Future<void> getSessionData()async{
      SharedPreferences sharedPreferences = await
      SharedPreferences.getInstance();
     
      log("------isLogin from SessionData--------${isLogin.toString()}");

      isLogin = sharedPreferences.getBool("LoginSession") ?? false;
      emailId = sharedPreferences.getString("email") ?? "";
    }
}

 