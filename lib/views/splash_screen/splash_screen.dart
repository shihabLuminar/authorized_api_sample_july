import 'package:authorized_api_sample_july/utils/app_utils.dart';
import 'package:authorized_api_sample_july/views/home_screen/home_screen.dart';
import 'package:authorized_api_sample_july/views/login_screen/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () async {
      final String? savedToken =
          await AppUtils.getToken(); //get saved token from storage

      if (savedToken != null && savedToken.isNotEmpty) {
        // if token exists  navigate to homes screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        //  if token is null or empty  -> login

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      }
    });

    return Scaffold(
      backgroundColor: Colors.blue,
      body: const Center(
        child: Text(
          'Welcome',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
