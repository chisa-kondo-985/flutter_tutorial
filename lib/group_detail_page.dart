import 'package:flutter/material.dart';
// import definition of the Group class and Member class.
import 'main.dart';

class GroupDetailPage extends StatelessWidget {
  final Group group;

  const GroupDetailPage({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // === Application Bar ===
      appBar: AppBar(
        title: const Text('band info'),
        backgroundColor: Colors.blue.shade400,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      // === Application Body ===
      body: Column(
        children: [
          Image.asset(group.groupImage),
          const SizedBox(height: 10),
          Text('結成年: ${group.yearFormed}', style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 10),
          const Text('メンバー: ', style: TextStyle(fontSize: 16)),
          ...group.members.map((member) => ListTile(
                title: Text(member.name, style: const TextStyle(fontSize: 20)),
                subtitle: Text('年齢: ${member.age}歳, 役割: ${member.role}'),
              ))
        ],
      ),
    );
  }
}
