import 'package:authorized_api_sample_july/app_config.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppUtils {
  // to show one time snackbar
  static showOntimeSnackbar(
      {required BuildContext context,
      required String message,
      Color backgroundColor = Colors.red}) {
    ScaffoldMessenger.of(context)
        .hideCurrentSnackBar(); // to dismiss the current snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(backgroundColor: backgroundColor, content: Text(message)),
    );
  }

// function to store data to sharedpreferences
  static Future<void> saveData(
      {required String key, required String? value}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString(key, value ?? "");
  }

// function to get token from local sotrage
  static Future<String?> getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final String? accessToken = pref.getString(AppConfig.ACCESSTOKEN);
    return accessToken;
  }
}
