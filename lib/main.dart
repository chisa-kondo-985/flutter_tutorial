// import material.dart package.
import 'package:flutter/material.dart';

// === This is the main function to launch this application. ===
void main() {
  runApp(const MyApp());
}

// === This widget is the root of this application. ===
class MyApp extends StatelessWidget {
  // Initialize the MyApp widget's variable.
  const MyApp({super.key});

  @override
  // Build the MyApp (statelessWidget) widget including all the children widgets whenever the state is changed.
  Widget build(BuildContext context) {
    // Decide application basic settings.
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

// === This widget is the home page of this application. ===
class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// === This widget is the state of this application.
class _MyHomePageState extends State<MyHomePage> {
  // Prepare the controller for the text field.
  final TextEditingController _controller = TextEditingController();

  // Build the _MyHomePageState (State) widget including all the children widgets whenever the state is changed.
  @override
  Widget build(BuildContext context) {
    // Decide the application UI using the Scaffold widget.
    return Scaffold(
      // === Application Bar ===
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.pink.shade400,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      // === Application Body ===
      body: Column(
        children: <Widget>[
          // Input Field
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
          // "Send" Button
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                // If this button is pressed and the inputNumber is int type and NOT null, the screen will transition.
                // And the inputNumber is shown on the next page.
                // If inputNumber is null, the Input Error dialog will be appear.
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
                            title: const Text('入力エラー'),
                            content: const Text('数字を入力してください'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('OK'))
                            ],
                          );
                        });
                  }
                },
                child: const Text('送信'),
              ),
            ),
          ),
        ],
      ),
      // === Application Background Color ===
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
