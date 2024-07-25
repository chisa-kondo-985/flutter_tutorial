import 'package:flutter/material.dart';
import 'package:flutter_tutorial/screen/users_data_list_screen.dart';

class RiceGroupScreen extends UsersDataListScreen {
  const RiceGroupScreen({super.key, required super.appBarTitle, required super.url});

  @override
  Widget createUserDataListTile(json) {
    return ListTile(
      title: Text('PostID: ${json['id'].toString()}'),
      subtitle: Text('Name: ${json['name']}'),
    );
  }
}
