import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sensors/cubit/sensor_data_cubit.dart';
import 'package:sensors/data/sensor_data_repository.dart';
import 'package:sensors/ui/footer.dart';
import 'package:sensors/ui/raw_data_view.dart';
import 'package:sensors/ui/sensors_view.dart';
import 'package:sensors/ui/dashboard_view.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: DefaultTabController(
        length: 3,
        initialIndex: 1,
        child: RepositoryProvider(
          create: (context) => SensorDataRepository(),
          child: BlocProvider(
            create: (context) => SensorDataCubit(
              repo: context.read<SensorDataRepository>(),
            )..loadData(),
            child: Scaffold(
              persistentFooterButtons: const [
                Footer(),
              ],
              appBar: AppBar(
                title: const Text('Rave Cave'),
                bottom: const TabBar(
                  tabs: [
                    Tab(
                      icon: Icon(Icons.data_object),
                    ),
                    Tab(
                      icon: Icon(Icons.home),
                    ),
                    Tab(
                      icon: Icon(Icons.sensors),
                    ),
                  ],
                ),
              ),
              body: BlocBuilder<SensorDataCubit, SensorDataState>(
                builder: (context, state) {
                  switch (state) {
                    case SensorDataInitial():
                      return const Center(child: Text('Welcome!'));
                    case SensorDataLoading():
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    case SensorDataLoaded():
                      return TabBarView(
                        children: [
                          Center(
                            child: RawDataView(
                              state: state,
                            ),
                          ),
                          Center(
                            child: DashboardView(
                              state: state,
                            ),
                          ),
                          Center(
                            child: SensorsView(
                              state: state,
                            ),
                          ),
                        ],
                      );
                    case SensorDataError():
                      return const Center(child: Text('Error: '));
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
