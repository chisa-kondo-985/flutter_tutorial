import 'package:flutter/material.dart';
import 'group.dart';

class GroupDetailPage extends StatelessWidget {
  final Group group;

  const GroupDetailPage({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // === Application Bar ===
      appBar: AppBar(
        title: const Text('Details'),
        backgroundColor: Colors.blue.shade400,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      // === Application Body ===
      body: Column(
        children: [
          Image.asset(group.groupImage),
          const SizedBox(height: 10),
          Text('Year Established: ${group.yearFormed}', style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 10),
          const Text('Members: ', style: TextStyle(fontSize: 16)),
          ...group.members.map(
            (member) => ListTile(
              title: Text(member.name, style: const TextStyle(fontSize: 20)),
              subtitle: Text('Age: ${member.age}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: member.roles.map((role) => role.roleIcon()).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
