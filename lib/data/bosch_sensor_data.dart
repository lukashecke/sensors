import 'dart:convert';
import 'package:sensors/data/location.dart';
import 'package:sensors/data/sensor.dart';
import 'package:sensors/data/sensor_data_value.dart';

BoschSensorData boschSensorDataFromJson(String str) =>
    BoschSensorData.fromJson(json.decode(str));

String boschSensorDataToJson(BoschSensorData data) =>
    json.encode(data.toJson());

class BoschSensorData {
  final DateTime timestamp;
  final List<Sensordatavalue> sensordatavalues;
  final int id;
  final Sensor sensor;
  final dynamic samplingRate;
  final Location location;

  BoschSensorData({
    required this.timestamp,
    required this.sensordatavalues,
    required this.id,
    required this.sensor,
    required this.samplingRate,
    required this.location,
  });

  factory BoschSensorData.fromJson(Map<String, dynamic> json) =>
      BoschSensorData(
        timestamp: DateTime.parse(json["timestamp"]),
        sensordatavalues: List<Sensordatavalue>.from(
            json["sensordatavalues"].map((x) => Sensordatavalue.fromJson(x))),
        id: json["id"],
        sensor: Sensor.fromJson(json["sensor"]),
        samplingRate: json["sampling_rate"],
        location: Location.fromJson(json["location"]),
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp.toIso8601String(),
        "sensordatavalues":
            List<dynamic>.from(sensordatavalues.map((x) => x.toJson())),
        "id": id,
        "sensor": sensor.toJson(),
        "sampling_rate": samplingRate,
        "location": location.toJson(),
      };
}
