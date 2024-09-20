import 'package:flutter/material.dart';
import 'package:sensors/cubit/sensor_data_cubit.dart';

class SensorsView extends StatelessWidget {
  const SensorsView({super.key, required this.state});

  final SensorDataLoaded state;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            const Text('Feinstaub-Sensor SDS011'),
            Text(state.novaSensorData.sensor.sensorType.manufacturer),
            const Text('Sensor ID'),
            Text(state.novaSensorData.sensor.id.toString()),
            const Text('Letztes Update'),
            Text(state.novaSensorData.timestamp.toIso8601String()),
          ],
        ),
        Column(
          children: [
            const Text('Temperatur/Luftdruck-Sensor BMP280'),
            Text(state.boschSensorData.sensor.sensorType.manufacturer),
            const Text('Sensor ID'),
            Text(state.boschSensorData.sensor.id.toString()),
            const Text('Letztes Update'),
            Text(state.boschSensorData.timestamp.toIso8601String()),
          ],
        ),
      ],
    );
  }
}
