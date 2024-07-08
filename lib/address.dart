import 'package:flutter_tutorial/geography.dart';

class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geography geography;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geography,
  });

  Address.fromJson(Map<String, dynamic> json)
      : street = json['street'] as String,
        suite = json['suite'] as String,
        city = json['city'] as String,
        zipcode = json['zipcode'] as String,
        geography = Geography.fromJson(json['geo']);
}
