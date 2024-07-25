import 'package:flutter/material.dart';
import 'package:flutter_tutorial/breakfast_main.dart';
import 'package:flutter_tutorial/screen/home_screen.dart';

class BreakfastGroupListScreen extends StatelessWidget {
  const BreakfastGroupListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeScreen(
      appBar: AppBar(
        title: const Text('朝ごはんの派閥'),
        backgroundColor: Colors.blue.shade400,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      applicationBody: ListView.builder(
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
