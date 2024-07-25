import 'package:flutter/material.dart';
import 'package:flutter_tutorial/screen/users_data_list_screen.dart';

class NoneGroupScreen extends UsersDataListScreen {
  const NoneGroupScreen({super.key, required super.appBarTitle, required super.url});

  @override
  Widget createUserDataListTile(json) {
    return ListTile(
      title: Text('ID: ${json['id'].toString()}'),
      subtitle: Text('User Name: ${json['username']}'),
    );
  }
}
