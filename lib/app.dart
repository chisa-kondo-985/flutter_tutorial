import 'dart:convert';
import 'package:flutter/material.dart';
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
  GetUserDataState createState() => GetUserDataState();
}

// === This widget is the body element of this application. ===
class GetUserDataState extends State<ApplicationBody> {
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
        // Convert from decodedJson to Response object's instance, and put in the list.
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

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Response>>(
        future: fetchAddress(),
        builder: (BuildContext context, AsyncSnapshot<List<Response>> snapshot) {
          List<Widget> children;
          if (snapshot.connectionState == ConnectionState.waiting) {
            children = <Widget>[const Center(child: CircularProgressIndicator())];
          } else if (snapshot.hasData) {
            children = <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    var user = snapshot.data![index];
                    return ListTile(
                      title: Text(user.userName),
                      subtitle: Text(user.email),
                    );
                  },
                ),
              )
            ];
          } else if (snapshot.hasError) {
            children = <Widget>[
              Center(
                child: Text('Error: ${snapshot.error}'),
              ),
            ];
          } else {
            children = <Widget>[
              const Center(child: Text('No data found')),
            ];
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: children,
          );
        });
  }
}
