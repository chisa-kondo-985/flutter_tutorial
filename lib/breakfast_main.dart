import 'package:flutter/material.dart';
import 'package:flutter_tutorial/screen/bread_group_screen.dart';
import 'package:flutter_tutorial/screen/none_group_screen.dart';
import 'package:flutter_tutorial/screen/noodle_group_screen.dart';
import 'package:flutter_tutorial/screen/potato_group_screen.dart';
import 'package:flutter_tutorial/screen/rice_group_screen.dart';

enum BreakfastMain {
  bread,
  rice,
  noodle,
  potato,
  none;

  String get description {
    switch (this) {
      case BreakfastMain.bread:
        return 'パン派';
      case BreakfastMain.rice:
        return 'ご飯派';
      case BreakfastMain.noodle:
        return '麺派';
      case BreakfastMain.potato:
        return '芋派';
      case BreakfastMain.none:
        return '食べない派';
    }
  }

  Widget get screen {
    switch (this) {
      case BreakfastMain.bread:
        return const BreadGroupScreen(
          appBarTitle: 'パン派のユーザー一覧',
          url: 'https://jsonplaceholder.typicode.com/posts',
        );
      case BreakfastMain.rice:
        return const RiceGroupScreen(
          appBarTitle: 'ご飯派のユーザ一覧',
          url: 'https://jsonplaceholder.typicode.com/comments',
        );
      case BreakfastMain.noodle:
        return const NoodleGroupScreen(
          appBarTitle: '麺派のユーザ一覧',
          url: 'https://jsonplaceholder.typicode.com/albums',
        );
      case BreakfastMain.potato:
        return const PotatoGroupScreen(
          appBarTitle: '芋派のユーザ一覧',
          url: 'https://jsonplaceholder.typicode.com/todos',
        );
      case BreakfastMain.none:
        return const NoneGroupScreen(
          appBarTitle: '食べない派のユーザ一覧',
          url: 'https://jsonplaceholder.typicode.com/users',
        );
    }
  }
}
