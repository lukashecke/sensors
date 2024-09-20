import 'dart:convert';
import 'package:sensors/data/bosch_sensor_data.dart';
import 'package:sensors/data/nova_sensor_data.dart';
import 'package:http/http.dart' as http;

class SensorDataRepository {
  Future<List<NovaSensorData>> fetchNovaSensorData() async {
    final response = await http.get(
        Uri.parse('https://data.sensor.community/airrohr/v1/sensor/75772/'));

    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body);
      List<NovaSensorData> measures = List<NovaSensorData>.from(
          l.map((model) => NovaSensorData.fromJson(model)));
      return measures;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<BoschSensorData>> fetchBoschSensorData() async {
    final response = await http.get(
        Uri.parse('https://data.sensor.community/airrohr/v1/sensor/75773/'));

    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body);
      List<BoschSensorData> measures = List<BoschSensorData>.from(
          l.map((model) => BoschSensorData.fromJson(model)));
      return measures;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
