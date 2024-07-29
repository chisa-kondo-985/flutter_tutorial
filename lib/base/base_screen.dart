import 'package:flutter/material.dart';
import 'package:flutter_tutorial/base/custom_bottom_bar.dart';

class BaseScreen extends StatelessWidget {
  final PreferredSizeWidget customAppBar;
  final Widget customAppBody;

  const BaseScreen({
    super.key,
    required this.customAppBar,
    required this.customAppBody,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Training for using extends',
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      home: Scaffold(
        // === Application Bar ===:
        appBar: customAppBar,
        // === Application body ===
        body: customAppBody,
        // === Application Bottom Navigation Bar ===
        bottomNavigationBar: const CustomBottomBar(),
        // === Application Background Color ===
        backgroundColor: Colors.white,
      ),
    );
  }
}
