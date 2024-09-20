import 'package:flutter/material.dart';
import 'package:sensors/cubit/sensor_data_cubit.dart';

class SensorDataGrid extends StatelessWidget {
  const SensorDataGrid({
    super.key,
    required this.state,
  });

  final SensorDataLoaded state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Luftdruck:'),
                      Text(
                        '${state.boschSensorData.sensordatavalues.first.value.replaceRange(3, null, '.${state.boschSensorData.sensordatavalues.first.value.substring(3, 5)}')} hPa',
                      ),
                    ],
                  ),
                ),
              ),
              const Expanded(
                child: Card(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Luftfeuchtigkeit:'),
                        Text('folgt...'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Card(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Feinstaub (10µm):'),
                        Text(
                            '${state.novaSensorData.sensordatavalues.first.value} µg/m³'),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Feinstaub (2,5µm):'),
                        Text(
                            '${state.novaSensorData.sensordatavalues.last.value} µg/m³'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
