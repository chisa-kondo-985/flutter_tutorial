import 'package:flutter/material.dart';
import 'package:flutter_tutorial/base/base_detail_screen.dart';

class PotatoGroupScreen extends BaseDetailScreen {
  const PotatoGroupScreen({super.key, required super.appBarTitle, required super.url});

  @override
  Widget createUserDataListTile(json) {
    return ListTile(
      title: Text('UserID: ${json['id'].toString()}'),
      subtitle: Text('Title: ${json['title']}'),
    );
  }
}
