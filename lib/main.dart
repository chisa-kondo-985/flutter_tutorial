import 'package:flutter/material.dart';

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
    final double deviceWidth = MediaQuery.of(context).size.width;

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
            // flex: 1,
            child: Container(
              width: deviceWidth,
              alignment: Alignment.center,
              child: const Text(
                'You have pushed the button this many times:',
                style: TextStyle(fontSize: 32),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            // flex: 1,
            child: Container(
              width: deviceWidth,
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
