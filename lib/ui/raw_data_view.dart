import 'package:flutter/material.dart';
import 'package:sensors/cubit/sensor_data_cubit.dart';

class RawDataView extends StatelessWidget {
  const RawDataView({super.key, required this.state});

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
            const Text('Feinstaub (10µm)'),
            Text(state.novaSensorData.sensordatavalues.first.value),
            const Text('Feinstaub (2,5µm):'),
            Text(state.novaSensorData.sensordatavalues.last.value),
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
            const Text('Luftdruck'),
            Text(state.boschSensorData.sensordatavalues.first.value),
            const Text('Temperatur'),
            Text(state.boschSensorData.sensordatavalues.last.value),
          ],
        ),
      ],
    );
  }
}
