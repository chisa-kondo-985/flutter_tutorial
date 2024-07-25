import 'package:flutter/material.dart';
import 'package:flutter_tutorial/screen/users_data_list_screen.dart';

class BreadGroupScreen extends UsersDataListScreen {
  const BreadGroupScreen({super.key, required super.appBarTitle, required super.url});

  @override
  Widget createUserDataListTile(json) {
    return ListTile(
      title: Text('UserID: ${json['id'].toString()}'),
      subtitle: Text('Post title: ${json['title']}'),
    );
  }
}
