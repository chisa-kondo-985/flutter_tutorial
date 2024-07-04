import 'package:flutter_tutorial/address.dart';

class Response {
  final String? message;
  final Address? address;
  final int status;

  Response({required this.message, required this.address, required this.status});

  factory Response.fromJson(Map responseJson) {
    // If the zipcode exists, address will have Address object.
    // If the zipcode doesn't exist, address will be null.
    var address = responseJson['results'] != null ? Address.fromJson(responseJson['results'][0]) : null;

    return Response(
      message: responseJson['message'],
      address: address,
      status: responseJson['status'],
    );
  }
}
