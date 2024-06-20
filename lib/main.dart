import 'package:flutter/material.dart';

// This is the main function to launch the this application.
void main() {
  runApp(const MyApp());
}

// Declare the MyApp class.
// This widget is the root of MyApp.
class MyApp extends StatelessWidget {
  // Initialize the MyApp class variable.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo'),
    );
  }
}

// Declare the MyHomePage class.
// This widget is the home page of this application.
class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done by the _incrementCounter method above.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.pink.shade400,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: SizedBox(
                width: 300,
                child: TextField(
                  controller: _controller,
                  maxLength: 10,
                  decoration: const InputDecoration(
                    labelText: '数字を入力してください',
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  final inputNumber = int.tryParse(_controller.text);
                  if (inputNumber != null) {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                      return NextPage(inputNumber: inputNumber);
                    }));
                  } else {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('入力エラー'),
                            content: Text('数字を入力してください'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('OK'))
                            ],
                          );
                        });
                  }
                },
                child: const Text('次へ'),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.pink.shade100,
    );
  }
}

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
