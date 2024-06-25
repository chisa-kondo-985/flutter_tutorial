// import material.dart package.
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './nextpage.dart';

// Prepare items for the Location list.
const List<String> _locationNames = <String>[
  '北海道',
  '青森県',
  '岩手県',
  '宮城県',
  '秋田県',
  '山形県',
  '福島県',
  '茨城県',
  '栃木県',
  '群馬県',
  '埼玉県',
  '千葉県',
  '東京都',
  '神奈川県',
  '新潟県',
  '富山県',
  '石川県',
  '福井県',
  '山梨県',
  '長野県',
  '岐阜県',
  '静岡県',
  '愛知県',
  '三重県',
  '滋賀県',
  '京都府',
  '大阪府',
  '兵庫県',
  '奈良県',
  '和歌山県',
  '鳥取県',
  '島根県',
  '岡山県',
  '広島県',
  '山口県',
  '徳島県',
  '香川県',
  '愛媛県',
  '高知県',
  '福岡県',
  '佐賀県',
  '長崎県',
  '熊本県',
  '大分県',
  '宮崎県',
  '鹿児島県',
  '沖縄県',
];

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
      home: Scaffold(
        // === Application Bar ===
        appBar: AppBar(
          title: const Text('Flutter Demo'),
          backgroundColor: Colors.blue.shade400,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        // === Application Body ===
        body: const ApplicationBody(),
        // === Application Background Color ===
        backgroundColor: Colors.white,
      ),
    );
  }
}

// === This widget is the body element of this application. ===
class ApplicationBody extends StatefulWidget {
  const ApplicationBody({super.key});

  @override
  State<ApplicationBody> createState() => _FormState();
}

// === This widget is the state of this application.
class _FormState extends State<ApplicationBody> {
  // Prepare variable for the input text.
  final TextEditingController _controller = TextEditingController();

  // Prepare keys for radio button.
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _genderText = '';

  // Prepare the variable and function for the CupertinoPicker.
  int _selectedLocation = 0;
  void _showDialog(Widget child) {
    // This is the showCupertinoModalPopup function.
    // Shows a modal iOS-style popup that slides up from the bottom of the screen.
    showCupertinoModalPopup<void>(
      context: context,
      builder: ((BuildContext context) => Container(
            // This is height of the picker area.
            height: 300,
            // This is creating the 6px of padding on the top of the picker area.
            padding: const EdgeInsets.only(top: 6.0),
            // This is creating the margin of bottom of the picker area.
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            // This is picker's Background Color. If this is not defined, the picker became transparent.
            color: CupertinoColors.systemBackground.resolveFrom(context),
            // This insets its child by sufficient padding to avoid intrusions by the operating system.
            child: SafeArea(
              top: false,
              child: child,
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // === Input User Name ===
          const SizedBox(
            width: 300,
            child: Text(
              '氏名',
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(
            width: 300,
            child: TextFormField(
              controller: _controller,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(hintText: '山田 太郎', counterStyle: TextStyle(color: Colors.black26)),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return '名前を入力してください。';
                }
                return null;
              },
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          // === Input User Gender ===
          const SizedBox(
            width: 300,
            child: Text(
              '性別',
              textAlign: TextAlign.start,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio(
                value: '男性',
                groupValue: _genderText,
                onChanged: (value) {
                  setState(() {
                    _genderText = value!;
                  });
                },
              ),
              const Text('男性'),
              Radio(
                value: '女性',
                groupValue: _genderText,
                onChanged: (value) {
                  setState(() {
                    _genderText = value!;
                  });
                },
              ),
              const Text('女性'),
              Radio(
                value: 'その他',
                groupValue: _genderText,
                onChanged: (value) {
                  setState(() {
                    _genderText = value!;
                  });
                },
              ),
              const Text('その他'),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          // === Input User's Hometown ===
          const SizedBox(
            width: 300,
            child: Text(
              '出身地',
              textAlign: TextAlign.start,
            ),
          ),
          CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () => _showDialog(
                    CupertinoPicker(
                      magnification: 1.22,
                      // This is for the angle of the picker wheel.
                      squeeze: 1.0,
                      // This is for enlarging the center item of the wheel.
                      useMagnifier: true,
                      // This is for the height of the picker items.
                      itemExtent: 32.0,
                      // This is the controller to read and control the current item, and to set the initial item.
                      scrollController: FixedExtentScrollController(initialItem: _selectedLocation),
                      // An option callback when the currently centered item changes.
                      onSelectedItemChanged: (int selectedItem) {
                        setState(() {
                          _selectedLocation = selectedItem;
                        });
                      },
                      children: List<Widget>.generate(_locationNames.length, (int index) {
                        return Center(child: Text(_locationNames[index]));
                      }),
                    ),
                  ),
              child: Text(
                _locationNames[_selectedLocation],
                style: const TextStyle(
                  fontSize: 22.0,
                ),
              )),
          const SizedBox(
            height: 40,
          ),
          // === Send button ===
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => NextPage(
                          textFieldValue: _controller.text,
                          radioValue: _genderText,
                          pickerValue: _locationNames[_selectedLocation],
                        )));
              }
            },
            child: const Text('送信'),
          ),
        ],
      ),
    );
  }
}
