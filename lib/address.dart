class Address {
  final String address1;
  final String address2;
  final String address3;
  final String kana1;
  final String kana2;
  final String kana3;
  final String prefcode;
  final String zipcode;

  Address(
      {required this.address1,
      required this.address2,
      required this.address3,
      required this.kana1,
      required this.kana2,
      required this.kana3,
      required this.prefcode,
      required this.zipcode});

  factory Address.convertFromJsonToDartObject(Map<String, dynamic> json) {
    return Address(
      address1: json['address1'] as String,
      address2: json['address2'] as String,
      address3: json['address3'] as String,
      kana1: json['kana1'] as String,
      kana2: json['kana2'] as String,
      kana3: json['kana3'] as String,
      prefcode: json['prefcode'] as String,
      zipcode: json['zipcode'] as String,
    );
  }
}
