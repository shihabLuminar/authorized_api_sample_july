import 'package:authorized_api_sample_july/controller/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await context.read<HomeScreenController>().fetchAllProducts(context);
        },
      ),
      body: Center(
        child: Text("Home screen"),
      ),
    );
  }
}
