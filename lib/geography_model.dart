class GeographyModel {
  final double latitude;
  final double longitude;

  GeographyModel({required this.latitude, required this.longitude});

  GeographyModel.fromJson(Map<String, dynamic> json)
      : latitude = double.parse(json['lat'] as String),
        longitude = double.parse(json['lng'] as String);
}
