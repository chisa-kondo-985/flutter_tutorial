import 'package:flutter_tutorial/address_model.dart';
import 'package:flutter_tutorial/company_model.dart';

class UserModel {
  final int id;
  final String name;
  final String userName;
  final String email;
  final AddressModel address;
  final String phone;
  final String website;
  final CompanyModel company;

  UserModel({
    required this.id,
    required this.name,
    required this.userName,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        name = json['name'] as String,
        userName = json['username'] as String,
        email = json['email'] as String,
        address = AddressModel.fromJson(json['address']),
        phone = json['phone'] as String,
        website = json['website'] as String,
        company = CompanyModel.fromJson(json['company']);
}
