import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// This is the main function to launch the MyApp.
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
      ),
      home: const MyHomePage(title: 'Flutter Demo'),
    );
  }
}

// Declare the MyHomePage class.
// This widget is the home page of your application.
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This class is the configuration for the state.
  // It holds the values (in this case the title) provided by the parent and used by the build method of the State.
  // Fields in a Widget subclass are always marked "final".
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

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
              child: const SizedBox(
                width: 300,
                child: TextField(
                  maxLength: 10,
                  decoration: InputDecoration(
                    labelText: '数字を入力してください',
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text('$_counter', style: const TextStyle(fontSize: 40)),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.pink.shade100,
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        backgroundColor: Colors.pink.shade400,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}
