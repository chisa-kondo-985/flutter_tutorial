import 'package:flutter/material.dart';
import 'package:flutter_tutorial/bread_group_page.dart';
import 'package:flutter_tutorial/breakfast_main.dart';

class BreakfastGroupCard extends StatelessWidget {
  const BreakfastGroupCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: BreakfastMain.values.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.white,
          child: ListTile(
              title: Text(BreakfastMain.values[index].description),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BreadGroupPage(
                              url: BreakfastMain.values[index].link,
                              appBarTitle: '${BreakfastMain.values[index].description}のユーザー一覧',
                            )));
              }),
        );
      },
    );
  }
}
