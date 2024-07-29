import 'package:flutter/material.dart';
import 'package:flutter_tutorial/breakfast_main.dart';
import 'package:flutter_tutorial/base/base_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      customAppBar: AppBar(
        title: const Text('朝ごはんの派閥'),
        backgroundColor: Colors.blue.shade400,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      customAppBody: ListView.builder(
        itemCount: BreakfastMain.values.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Colors.white,
            child: ListTile(
                title: Text(BreakfastMain.values[index].description),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BreakfastMain.values[index].screen));
                }),
          );
        },
      ),
    );
  }
}
