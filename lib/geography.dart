class Geography {
  final double latitude;
  final double longitude;

  Geography({required this.latitude, required this.longitude});

  Geography.fromJson(Map<String, dynamic> json)
      : latitude = double.parse(json['lat'] as String),
        longitude = double.parse(json['lng'] as String);
}
