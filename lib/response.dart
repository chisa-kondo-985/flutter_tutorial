import 'package:flutter_tutorial/address.dart';

class Response {
  final String? message;
  final Address? address;
  final int status;

  Response({required this.message, required this.address, required this.status});

  factory Response.convertFromJsonToDartObject(Map json) {
    // If the zipcode exists, results will have Address object.
    // If the zipcode doesn't exist, results will be null.
    var address = json['results'] != null ? Address.convertFromJsonToDartObject(json['results'][0]) : null;

    return Response(
      message: json['message'],
      address: address,
      status: json['status'],
    );
  }
}
