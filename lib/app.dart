import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'response.dart';
import 'address.dart';

// === This widget is the root of this application. ===
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  // Build the MyApp (statelessWidget) widget including all the children widgets whenever the state is changed.
  Widget build(BuildContext context) {
    // Decide application basic settings.
    return MaterialApp(
      title: 'API connection (Flutter)',
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      home: Scaffold(
          // === Application Bar ===
          appBar: AppBar(
            title: const Text('Search Your Address'),
            backgroundColor: Colors.blue.shade400,
            foregroundColor: Colors.white,
            centerTitle: true,
          ),
          // === Application Body ===
          body: const ApplicationBody(),
          // === Application Background Color ===
          backgroundColor: Colors.white),
    );
  }
}

class ApplicationBody extends StatefulWidget {
  const ApplicationBody({super.key});

  @override
  SearchAddressState createState() => SearchAddressState();
}

// === This widget is the body element of this application. ===
class SearchAddressState extends State<ApplicationBody> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _zipcodeController = TextEditingController();
  String? _resultMessage;
  Address? _address;
  int searched = 0;

  // Get the address by http connection.
  Future<void> fetchAddress(String zipcode) async {
    String url = 'https://zipcloud.ibsnet.co.jp/api/search?zipcode=$zipcode';

    try {
      // Send Get request, and wait until can get the response.
      final httpResponse = await http.get(Uri.parse(url));
      // If the status code is 200,
      if (httpResponse.statusCode == 200) {
        // Decode http response.
        final decodedJson = jsonDecode(httpResponse.body);
        // Convert form Json object (as a Dart's Map<String, dynamic>) to Response object's instance.
        final apiResponse = Response.fromJson(decodedJson);
        // Redraw the UI.
        setState(() {
          _resultMessage = apiResponse.message;
          _address = apiResponse.address;
          ++searched;
        });
        // If the status code is NOT 200,
      } else {
        setState(() {
          _resultMessage = 'Failed to load address: ${httpResponse.statusCode}';
          _address = null;
        });
      }
      // If some Exception happen,
    } catch (message) {
      setState(() {
        _resultMessage = 'Error: $message';
        _address = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: _formkey,
            child: SizedBox(
              width: 300,
              child: TextFormField(
                autofocus: true,
                maxLength: 8,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  labelText: '郵便番号',
                ),
                controller: _zipcodeController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '郵便番号を入力してください';
                  } else if (value.length < 7) {
                    return '郵便番号を正しく入力してください';
                  } else {
                    return null;
                  }
                },
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final zipcode = _zipcodeController.text;
              if (_formkey.currentState!.validate()) {
                fetchAddress(zipcode);
              }
            },
            child: const Text('Search'),
          ),
          if (_resultMessage != null) ...[
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 300,
              child: Text(_resultMessage!),
            ),
          ],
          // Widgets with condition by using the spread operator.
          if (_address == null && searched >= 1) ...[
            const SizedBox(
              height: 20,
            ),
            const Text('この郵便番号は無効です',
                textAlign: TextAlign.center, style: TextStyle(color: Color.fromARGB(255, 182, 26, 15))),
          ],
          if (_address != null) ...[
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '郵便番号: ${_address!.zipcode}',
                  ),
                  Text(
                    '住所: ${_address!.address1}${_address!.address2}${_address!.address3}',
                  ),
                  Text(
                    '読み方: ${_address!.kana1}${_address!.kana2}${_address!.kana3}',
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
