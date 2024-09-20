import 'package:sensors/data/sensor_type.dart';

class Sensor {
  final int id;
  final SensorType sensorType;
  final String pin;

  Sensor({
    required this.id,
    required this.sensorType,
    required this.pin,
  });

  factory Sensor.fromJson(Map<String, dynamic> json) => Sensor(
        id: json["id"],
        sensorType: SensorType.fromJson(json["sensor_type"]),
        pin: json["pin"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sensor_type": sensorType.toJson(),
        "pin": pin,
      };
}
