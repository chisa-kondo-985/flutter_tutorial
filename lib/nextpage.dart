import 'package:flutter/material.dart';

class NextPage extends StatelessWidget {
  final int inputNumber;
  NextPage({required this.inputNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next Page'),
        backgroundColor: Colors.pink.shade400,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(child: Text('$inputNumber')),
    );
  }
}
