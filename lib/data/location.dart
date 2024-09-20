class Location {
  final String country;
  final int exactLocation;
  final int id;
  final String latitude;
  final int indoor;
  final String altitude;
  final String longitude;

  Location({
    required this.country,
    required this.exactLocation,
    required this.id,
    required this.latitude,
    required this.indoor,
    required this.altitude,
    required this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        country: json["country"],
        exactLocation: json["exact_location"],
        id: json["id"],
        latitude: json["latitude"],
        indoor: json["indoor"],
        altitude: json["altitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        "exact_location": exactLocation,
        "id": id,
        "latitude": latitude,
        "indoor": indoor,
        "altitude": altitude,
        "longitude": longitude,
      };
}
