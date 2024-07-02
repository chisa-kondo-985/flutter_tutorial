import 'package:flutter/material.dart';
import 'group.dart';
import 'member.dart';
import 'group_detail_page.dart';

// === This widget is the root of this application. ===
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  // Build the MyApp (statelessWidget) widget including all the children widgets whenever the state is changed.
  Widget build(BuildContext context) {
    // Decide application basic settings.
    return MaterialApp(
      title: 'Bands (Flutter)',
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      home: Scaffold(
        // === Application Bar ===
        appBar: AppBar(
          title: const Text('Bands'),
          backgroundColor: Colors.blue.shade400,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        // === Application Body ===
        body: ApplicationBody(),
        // === Application Background Color ===
        backgroundColor: Colors.grey.shade100,
      ),
    );
  }
}

// === This widget is the body element of this application. ===
class ApplicationBody extends StatelessWidget {
  ApplicationBody({super.key});
  final List<Group> groups = [
    Group(
      groupName: 'The Beatles',
      groupImage: 'assets/images/Beatles.jpeg',
      yearFormed: 1960,
      members: [
        Member(name: 'John Lennon', age: 40, role: 'Vocals & Guitar'),
        Member(name: 'Paul McCartney', age: 79, role: 'Vocals & Bass Guitar'),
        Member(name: 'George Harrison', age: 58, role: 'Guitar & Vocals'),
        Member(name: 'Ringo Starr', age: 81, role: 'Drums & Vocals'),
      ],
    ),
    Group(
      groupName: 'The Rolling Stones',
      groupImage: 'assets/images/The_Rolling_Stones.jpg',
      yearFormed: 1962,
      members: [
        Member(name: 'Mick Jagger', age: 78, role: 'Vocals'),
        Member(name: 'Keith Richards', age: 77, role: 'Guitar'),
        Member(name: 'Charlie Watts', age: 80, role: 'Drums'),
        Member(name: 'Ronnie Wood', age: 74, role: 'Guitar'),
      ],
    ),
    Group(
      groupName: 'Queen',
      groupImage: 'assets/images/Queen.jpg',
      yearFormed: 1970,
      members: [
        Member(name: 'Freddie Mercury', age: 45, role: 'Vocals & Piano'),
        Member(name: 'Brian May', age: 76, role: 'Guitar & Vocals'),
        Member(name: 'Roger Taylor', age: 75, role: 'Drums & Vocals'),
        Member(name: 'John Deacon', age: 73, role: 'Bass Guitar'),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // Set the number of the list items.
      itemCount: groups.length,
      // Define what is shown in the list item.
      itemBuilder: (context, index) {
        final group = groups[index];
        return Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              tileColor: Colors.white,
              title: Text(group.groupName),
              trailing: const Icon(Icons.arrow_forward_ios, color: Colors.blue),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GroupDetailPage(group: group),
                  ),
                );
              },
            ));
      },
    );
  }
}
