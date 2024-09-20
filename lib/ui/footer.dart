import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sensors/cubit/sensor_data_cubit.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Center(
            child: IconButton(
                onPressed: () async =>
                    context.read<SensorDataCubit>().showInfo(),
                icon: const Icon(
                  Icons.info,
                )),
          ),
        ),
        Expanded(
          child: Center(
            child: IconButton(
              onPressed: () => context.read<SensorDataCubit>().loadData(),
              icon: const Icon(Icons.refresh),
            ),
          ),
        ),
      ],
    );
  }
}
