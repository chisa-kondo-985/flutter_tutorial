import 'package:flutter/material.dart';
import 'package:flutter_tutorial/breakfast_group_card.dart';
import 'package:flutter_tutorial/home_screen.dart';

class BreakfastGroupList extends StatelessWidget {
  const BreakfastGroupList({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeScreen(
      appBar: AppBar(
        title: const Text('朝ごはんの派閥'),
        backgroundColor: Colors.blue.shade400,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      applicationBody: const BreakfastGroupCard(),
    );
  }
}
