part of 'sensor_data_cubit.dart';

@immutable
sealed class SensorDataState {}

final class SensorDataInitial extends SensorDataState {}

final class SensorDataLoading extends SensorDataState {}

final class SensorDataLoaded extends SensorDataState {
  SensorDataLoaded({
    required this.novaSensorData,
    required this.boschSensorData,
  });
  final NovaSensorData novaSensorData;
  final BoschSensorData boschSensorData;
}

final class SensorDataError extends SensorDataState {
  SensorDataError({
    required this.errorMessage,
  });
  final String errorMessage;
}
