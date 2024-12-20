import 'dart:developer';

import 'package:authorized_api_sample_july/app_config.dart';
import 'package:authorized_api_sample_july/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreenController with ChangeNotifier {
  Future fetchAllProducts(BuildContext context) async {
    final url = Uri.parse(AppConfig.baseUrl + "/products-all/");
    final savedToken = await AppUtils.getToken();
    try {
      final response = await http.get(
        url,
        headers: {
          "Authorization": "Bearer $savedToken",
          "Content-Type": "application/json"
        },
      );
      log(response.body.toString());
      if (response.statusCode == 200) {
        AppUtils.showOntimeSnackbar(
            context: context,
            message: "Success------------",
            backgroundColor: Colors.green);
      } else {
        AppUtils.showOntimeSnackbar(
          context: context,
          message: "Failed------------",
        );
      }
    } catch (e) {
      AppUtils.showOntimeSnackbar(
        context: context,
        message: e.toString(),
      );
    }
  }
}
