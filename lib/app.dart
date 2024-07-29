import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/detail_page.dart';
import 'package:flutter_tutorial/sort_option.dart';
import 'package:http/http.dart' as http;
import 'user_model.dart';

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
        body: const UserListPage(),
        // === Application Background Color ===
        backgroundColor: Colors.white,
      ),
    );
  }
}

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<StatefulWidget> createState() => UserListPageState();
}

// === This widget is the body element of this application. ===
class UserListPageState extends State<UserListPage> {
  // Prepare list for storing user data.
  late Future<List<UserModel>> _usersData;

  // Get the users data by http connection.
  Future<List<UserModel>> fetchAddress(url) async {
    try {
      // Send Get request, and wait until can get the response.
      final httpResponse = await http.get(Uri.parse(url));
      // If the status code is 200,
      if (httpResponse.statusCode == 200) {
        // Decode http response.
        // DecodedJson remains in json format structure and becomes Map format ("" => '').
        final decodedJson = jsonDecode(httpResponse.body);
        // Convert from json format structure to Response object's instance, and add in the new list (apiResponse).
        List<UserModel> apiResponse = [];
        for (var json in decodedJson) {
          apiResponse.add(UserModel.fromJson(json));
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

  // Prepare list and variable for sorting user data list.
  List<UserModel> userDataList = [];
  SortOption sortOption = SortOption.byIdAsc;

  // Before the app UI is shown on the device, get user data.
  @override
  void initState() {
    super.initState();
    String url = 'https://jsonplaceholder.typicode.com/users';
    _usersData = fetchAddress(url);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              " 並び替え",
              style: TextStyle(fontSize: 16),
            ),
            // === Sort Buttons ===
            PopupMenuButton(
              onSelected: (SortOption selectedSortMethod) {
                sortOption = selectedSortMethod;
                setState(() {
                  userDataList = sortOption.sort(userDataList);
                });
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<SortOption>>[
                const PopupMenuItem(
                  value: SortOption.byIdAsc,
                  child: Text('IDで昇順'),
                ),
                const PopupMenuItem(
                  value: SortOption.byIdDesc,
                  child: Text('IDで降順'),
                ),
                const PopupMenuItem(
                  value: SortOption.byNameAsc,
                  child: Text('名前で昇順'),
                ),
                const PopupMenuItem(
                  value: SortOption.byNameDesc,
                  child: Text('名前で降順'),
                ),
                const PopupMenuItem(
                  value: SortOption.byUsernameAsc,
                  child: Text('ユーザ名で昇順'),
                ),
                const PopupMenuItem(
                  value: SortOption.byUsernameDesc,
                  child: Text('ユーザ名で降順'),
                ),
              ],
              icon: const Icon(Icons.sort),
            ),
          ],
        ),
        Expanded(
          child: FutureBuilder<List<UserModel>>(
              future: _usersData,
              builder: (BuildContext context, AsyncSnapshot<List<UserModel>> snapshot) {
                // If the state is during loading the data, show the progress indicator.
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasData) {
                  // If finished loading data, show listView.
                  // === User List ===
                  if (userDataList.isEmpty) {
                    userDataList = snapshot.data!;
                  }
                  return ListView.builder(
                    itemCount: userDataList.length,
                    itemBuilder: (context, index) {
                      var user = userDataList[index];
                      return ListTile(
                        isThreeLine: true,
                        title: Text("名前: ${user.name}"),
                        subtitle: Text("ユーザID: ${user.id}\nユーザ名: ${user.userName}"),
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
                  );
                } else if (snapshot.hasError) {
                  // If the connection has some errors, show error messages.
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else {
                  // If couldn't find data, show this error message.
                  return const Center(child: Text('No data found'));
                }
              }),
        ),
      ],
    );
  }
}
