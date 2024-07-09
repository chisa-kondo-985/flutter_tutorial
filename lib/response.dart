import 'package:flutter_tutorial/address.dart';
import 'package:flutter_tutorial/company.dart';

class Response {
  final int id;
  final String name;
  final String userName;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;

  Response({
    required this.id,
    required this.name,
    required this.userName,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  Response.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        name = json['name'] as String,
        userName = json['username'] as String,
        email = json['email'] as String,
        address = Address.fromJson(json['address']),
        phone = json['phone'] as String,
        website = json['website'] as String,
        company = Company.fromJson(json['company']);
}
