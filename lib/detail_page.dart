import 'package:flutter/material.dart';
import 'response.dart';

class DetailPage extends StatelessWidget {
  final Response user;

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
                      Text(
                        'ID: ${user.id}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        'username: ${user.userName}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Name: ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              Text(
                user.name,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                'E-mail: ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              Text(
                user.email,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                'Zipcode: ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              Text(
                user.address.zipcode,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                'Address: ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              Text(
                '${user.address.suite} ${user.address.street} ${user.address.city}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                'Geography: ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              Text(
                'Latitude: ${user.address.geography.latitude}',
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                'Longitude: ${user.address.geography.longitude}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                'Phone: ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              Text(
                user.phone,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                'Website: ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              Text(
                user.website,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                'Company: ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              Text(
                'Company Name: ${user.company.companyName}',
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                'CatchPhrase: ${user.company.catchPhrase}',
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                'Business: ${user.company.business}',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
        // === Application Background Color ===
        backgroundColor: Colors.white,
      ),
    );
  }
}
