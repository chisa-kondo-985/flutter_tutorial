import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_tutorial/base/base_screen.dart';

class BaseDetailScreen extends StatelessWidget {
  final String appBarTitle;
  final String url;

  const BaseDetailScreen({
    super.key,
    required this.url,
    required this.appBarTitle,
  });

  Future<List<dynamic>> fetchData() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Widget createUserDataListTile(json) {
    return ListTile(
      title: Text(json['id'].toString()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      customAppBar: AppBar(
        title: Text(appBarTitle),
        leading: IconButton(
          icon: const Icon(
            Icons.navigate_before_rounded,
            color: Colors.white,
            size: 40,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.blue.shade400,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      customAppBody: FutureBuilder<List<dynamic>>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data available'));
          } else {
            return ListView.separated(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final json = snapshot.data![index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
                  child: createUserDataListTile(json),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Container(color: Colors.grey.shade300, height: 2);
              },
            );
          }
        },
      ),
    );
  }
}
