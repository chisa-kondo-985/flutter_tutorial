import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/detail_page.dart';
import 'package:http/http.dart' as http;
import 'response.dart';

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
          title: const Text('User List Page'),
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

class ApplicationBody extends StatefulWidget {
  const ApplicationBody({super.key});

  @override
  State<StatefulWidget> createState() => UserListPageState();
}

// === This widget is the body element of this application. ===
class UserListPageState extends State<ApplicationBody> {
  // Get the address by http connection.
  Future<List<Response>> fetchAddress() async {
    String url = 'https://jsonplaceholder.typicode.com/users';

    try {
      // Send Get request, and wait until can get the response.
      final httpResponse = await http.get(Uri.parse(url));
      // If the status code is 200,
      if (httpResponse.statusCode == 200) {
        // Decode http response.
        // DecodedJson remains in json format structure and becomes Map format ("" => '').
        final decodedJson = jsonDecode(httpResponse.body);
        // Convert from json format structure to Response object's instance, and add in the new list (apiResponse).
        List<Response> apiResponse = [];
        for (var json in decodedJson) {
          apiResponse.add(Response.fromJson(json));
        }
        return apiResponse;
        // If the status code is NOT 200,
      } else {
        throw Exception('Failed to load data');
      }
      // If some Exception happen,
    } catch (message) {
      throw Exception('$message');
    }
  }

  // Prepare flags for sorting.
  bool sortById = false;
  bool sortByUserName = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Response>>(
        future: fetchAddress(),
        builder: (BuildContext context, AsyncSnapshot<List<Response>> snapshot) {
          List<Widget> children;
          // If the state is during loading the data, show the progress indicator.
          if (snapshot.connectionState == ConnectionState.waiting) {
            children = <Widget>[const Center(child: CircularProgressIndicator())];
          } else if (snapshot.hasData) {
            // If finished loading data, show sort buttons and listView.
            // === Sort Buttons ===
            List<Response> userDataList = List.from(snapshot.data!);

            // If the id flag is true, sort list by id.
            if (sortById) {
              userDataList.sort((a, b) => a.id.compareTo(b.id));
            } else if (sortByUserName) {
              // If the userName flag is true, sort list by username.
              userDataList.sort((a, b) => a.userName.compareTo(b.userName));
            }

            children = <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton.icon(
                    onPressed: () {
                      setState(() {
                        sortById = true;
                        sortByUserName = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      textStyle: const TextStyle(fontSize: 16),
                      side: const BorderSide(
                        color: Colors.black,
                      ),
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 68),
                    ),
                    icon: Image.asset(
                      'assets/icons/sort.png',
                      width: 24,
                    ),
                    label: const Text('ID'),
                  ),
                  OutlinedButton.icon(
                    onPressed: () {
                      setState(() {
                        sortById = false;
                        sortByUserName = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      textStyle: const TextStyle(fontSize: 16),
                      side: const BorderSide(
                        color: Colors.black,
                      ),
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                    ),
                    icon: Image.asset(
                      'assets/icons/sort.png',
                      width: 24,
                    ),
                    label: const Text('NAME'),
                  ),
                ],
              ),
              // === User List ===
              Expanded(
                child: ListView.builder(
                  itemCount: userDataList.length,
                  itemBuilder: (context, index) {
                    var user = userDataList[index];
                    return ListTile(
                      title: Text(user.userName),
                      subtitle: Text(user.email),
                      trailing: const Icon(
                        Icons.navigate_next_rounded,
                        color: Colors.blue,
                        size: 32,
                      ),
                      onTap: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (BuildContext context) => DetailPage(user: user)));
                      },
                    );
                  },
                ),
              )
            ];
          } else if (snapshot.hasError) {
            // If the connection has some errors, show error messages.
            children = <Widget>[
              Center(
                child: Text('Error: ${snapshot.error}'),
              ),
            ];
          } else {
            // If couldn't find data, show this error message.
            children = <Widget>[
              const Center(child: Text('No data found')),
            ];
          } // After passed these conditions, the results will be returned in this widget.
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: children,
          );
        });
  }
}
