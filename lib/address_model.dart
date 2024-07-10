import 'package:flutter_tutorial/geography_model.dart';

class AddressModel {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final GeographyModel geography;

  AddressModel({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geography,
  });

  AddressModel.fromJson(Map<String, dynamic> json)
      : street = json['street'] as String,
        suite = json['suite'] as String,
        city = json['city'] as String,
        zipcode = json['zipcode'] as String,
        geography = GeographyModel.fromJson(json['geo']);
}
