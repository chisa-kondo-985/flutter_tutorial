import 'package:flutter/material.dart';
import 'user_model.dart';

class DetailPage extends StatelessWidget {
  final UserModel user;

  const DetailPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API connection (Flutter)',
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.navigate_before_rounded,
              color: Colors.white,
              size: 32,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('User Detail Page'),
          backgroundColor: Colors.blue.shade400,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        // === Application Body ===
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 20),
              Row(
                children: [
                  const Icon(Icons.account_circle, size: 80),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      createContent('ID: ${user.id}'),
                      createContent('username: ${user.userName}'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              createHeading('Name'),
              createContent(user.name),
              const SizedBox(height: 16),
              createHeading('E-mail'),
              createContent(user.email),
              const SizedBox(height: 16),
              createHeading('Zipcode'),
              createContent(user.address.zipcode),
              const SizedBox(height: 16),
              createHeading('Address'),
              createContent('${user.address.suite} ${user.address.street} ${user.address.city}'),
              const SizedBox(height: 16),
              createHeading('Geography'),
              createContent('Latitude: ${user.address.geography.latitude}'),
              createContent('Longitude: ${user.address.geography.longitude}'),
              const SizedBox(height: 16),
              createHeading('Phone'),
              createContent(user.phone),
              const SizedBox(height: 16),
              createHeading('Website'),
              createContent(user.website),
              const SizedBox(height: 16),
              createHeading('Company'),
              createContent('Company Name: ${user.company.companyName}'),
              createContent('CatchPhrase: ${user.company.catchPhrase}'),
              createContent('Business: ${user.company.business}'),
            ],
          ),
        ),
        // === Application Background Color ===
        backgroundColor: Colors.white,
      ),
    );
  }

  // Create headings.
  createHeading(text) {
    return Text(
      '$text:',
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
    );
  }

  // Create contents.
  createContent(text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 16),
    );
  }
}
