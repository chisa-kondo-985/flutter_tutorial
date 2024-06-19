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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
    // final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;

    // This method is rerun every time setState is called, for instance as done by the _incrementCounter method above.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade400,
        title: Text(widget.title),
      ),
      body: Center (
        // Center is a layout widget. 
        // It takes a single child and positions it in the middle of the parent.
        child: Column(
          // Column is also a layout widget. 
          // It takes a list of children and arranges them vertically. By default, it sizes itself to fit its children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Container(
                width: deviceWidth,
                child: const Text('You have pushed the button this many times:', style: TextStyle(fontSize: 32),),
              ),
            ),
            Expanded(
              flex: 5,
              child: Text('$_counter', style: const TextStyle(fontSize: 40))
            ),
          ],
        ),
      ),
      backgroundColor: Colors.pink.shade100,
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        backgroundColor: Colors.pink.shade400,
        child: const Icon(Icons.add),
      ), 
    );
  }
}
