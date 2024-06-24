import 'package:flutter/material.dart';

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next Page'),
        backgroundColor: Colors.blue.shade400,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: const Center(
        child: Text('送信成功'),
      ),
    );
  }
}
