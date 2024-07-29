import 'package:flutter/material.dart';
import 'package:flutter_tutorial/base/base_detail_screen.dart';

class NoneGroupScreen extends BaseDetailScreen {
  const NoneGroupScreen({super.key, required super.appBarTitle, required super.url});

  @override
  Widget createUserDataListTile(json) {
    return ListTile(
      title: Text('ID: ${json['id'].toString()}'),
      subtitle: Text('User Name: ${json['username']}'),
    );
  }
}
