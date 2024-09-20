class SensorType {
  final int id;
  final String name;
  final String manufacturer;

  SensorType({
    required this.id,
    required this.name,
    required this.manufacturer,
  });

  factory SensorType.fromJson(Map<String, dynamic> json) => SensorType(
        id: json["id"],
        name: json["name"],
        manufacturer: json["manufacturer"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "manufacturer": manufacturer,
      };
}
