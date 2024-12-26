import 'package:authorized_api_sample_july/controller/home_screen_controller.dart';
import 'package:authorized_api_sample_july/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeScreenState = context.watch<HomeScreenController>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await context.read<HomeScreenController>().fetchAllProducts(context);
        },
      ),
      appBar: AppBar(
        title: Text("Home Screen"),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Cancel")),
                    TextButton(
                      onPressed: () {
                        HelperFunctions.logout(context);
                      },
                      child: Text("Logout"),
                    ),
                  ],
                ),
              );
            },
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: Center(
        child: homeScreenState.isLoading
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: homeScreenState.productsList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(homeScreenState.productsList[index].name ?? ""),
                    subtitle: Text(
                        homeScreenState.productsList[index].description ?? ""),
                  );
                }),
      ),
    );
  }
}
