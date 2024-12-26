import 'dart:developer';
import 'package:authorized_api_sample_july/app_config.dart';
import 'package:authorized_api_sample_july/models/login_res_model.dart';
import 'package:authorized_api_sample_july/utils/app_utils.dart';
import 'package:authorized_api_sample_july/views/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginController with ChangeNotifier {
  Future<void> onLogin(
    BuildContext context, {
    required String email,
    required String pass,
  }) async {
    final url = Uri.parse("${AppConfig.baseUrl}/login");
    try {
      final response = await http.post(
        url,
        body: {
          "email": email,
          "password": pass,
        },
      );
      if (response.statusCode == 200) {
        LoginResModel resModel = loginResModelFromJson(response.body);
        if (resModel.access != null && resModel.access!.isNotEmpty) {
          await AppUtils.saveData(
              key: AppConfig.ACCESSTOKEN,
              value: resModel.access); // to store token to sharedpreferences
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
            (route) => false,
          );

          AppUtils.showOntimeSnackbar(
              context: context,
              message: 'Login successful!',
              backgroundColor: Colors.green);
        }
      } else {
        AppUtils.showOntimeSnackbar(
          context: context,
          message: 'Login Failed!',
        );
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
