import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:sensors/data/bosch_sensor_data.dart';
import 'package:sensors/data/nova_sensor_data.dart';
import 'package:sensors/data/sensor_data_repository.dart';
import 'package:url_launcher/url_launcher.dart';

part 'sensor_data_state.dart';

class SensorDataCubit extends Cubit<SensorDataState> {
  SensorDataCubit({required this.repo}) : super(SensorDataInitial());
  final SensorDataRepository repo;

  Future loadData() async {
    emit(SensorDataLoading());
    try {
      final boschSensorData = await repo.fetchBoschSensorData();
      final novaSensorData = await repo.fetchNovaSensorData();
      emit(SensorDataLoaded(
        novaSensorData: novaSensorData.first,
        boschSensorData: boschSensorData.first,
      ));
    } catch (e) {
      emit(SensorDataError(errorMessage: e.toString()));
    }
  }

  Future showInfo() async {
    final Uri url = Uri.parse('https://sensor.community/de/sensors/airrohr/');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
