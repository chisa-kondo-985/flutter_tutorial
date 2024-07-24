import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final PreferredSizeWidget appBar;
  final Widget applicationBody;

  const HomeScreen({
    super.key,
    required this.appBar,
    required this.applicationBody,
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
        // === Application Bar ===
        appBar: appBar,
        // === Application body ===
        body: applicationBody,
        // === Application Bottom Navigation Bar ===
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
        // === Application Background Color ===
        backgroundColor: Colors.white,
      ),
    );
  }
}
