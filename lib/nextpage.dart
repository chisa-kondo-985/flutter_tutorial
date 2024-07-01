import 'package:flutter/material.dart';

class NextPage extends StatelessWidget {
  final String textFieldValue;
  final String? radioValue;
  final String pickerValue;

  const NextPage({
    super.key,
    required this.textFieldValue,
    required this.radioValue,
    required this.pickerValue,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // === Application Bar ===
      appBar: AppBar(
        title: const Text('Next Page'),
        backgroundColor: Colors.blue.shade400,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      // === Application Body ===
      // Confirm the user input.
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('初めまして！'),
            Text('$textFieldValue さん。'),
            Text('あなたの性別は $radioValue'),
            Text('ご出身は $pickerValue'),
            const Text('ですね！'),
            const Text('よろしくお願いします！')
          ],
        ),
      ),
    );
  }
}
