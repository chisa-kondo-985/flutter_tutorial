import 'package:flutter_tutorial/address.dart';

class Response {
  final int id;
  final String name;
  final String userName;
  final String email;
  final Address address;

  Response({
    required this.id,
    required this.name,
    required this.userName,
    required this.email,
    required this.address,
  });

  Response.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        name = json['name'] as String,
        userName = json['username'] as String,
        email = json['email'] as String,
        address = Address.fromJson(json['address']);
}
