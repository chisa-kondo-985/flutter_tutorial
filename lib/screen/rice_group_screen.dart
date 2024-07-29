import 'package:flutter/material.dart';
import 'package:flutter_tutorial/base/base_detail_screen.dart';

class RiceGroupScreen extends BaseDetailScreen {
  const RiceGroupScreen({super.key, required super.appBarTitle, required super.url});

  @override
  Widget createUserDataListTile(json) {
    return ListTile(
      title: Text('PostID: ${json['id'].toString()}'),
      subtitle: Text('Name: ${json['name']}'),
    );
  }
}
