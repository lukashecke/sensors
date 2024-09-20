import 'package:flutter/material.dart';
import 'package:sensors/cubit/sensor_data_cubit.dart';
import 'package:sensors/ui/sensor_data_grid.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key, required this.state});

  final SensorDataLoaded state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 4,
            child: CircleAvatar(
              radius: 100,
              child: Text(
                '${state.boschSensorData.sensordatavalues.last.value} °C',
                style: const TextStyle(fontSize: 40),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: SensorDataGrid(state: state),
          ),
        ],
      ),
    );
  }
}
