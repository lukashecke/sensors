import 'dart:convert';
import 'package:sensors/data/location.dart';
import 'package:sensors/data/sensor.dart';
import 'package:sensors/data/sensor_data_value.dart';

NovaSensorData novaSensorDataFromJson(String str) =>
    NovaSensorData.fromJson(json.decode(str));

String novaSensorDataToJson(NovaSensorData data) => json.encode(data.toJson());

class NovaSensorData {
  final DateTime timestamp;
  final List<Sensordatavalue> sensordatavalues;
  final int id;
  final Sensor sensor;
  final dynamic samplingRate;
  final Location location;

  NovaSensorData({
    required this.timestamp,
    required this.sensordatavalues,
    required this.id,
    required this.sensor,
    required this.samplingRate,
    required this.location,
  });

  factory NovaSensorData.fromJson(Map<String, dynamic> json) => NovaSensorData(
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
