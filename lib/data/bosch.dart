class Bosch {
  final int id;
  final String timestamp;
  final double pressure;

  const Bosch({
    required this.id,
    required this.timestamp,
    required this.pressure,
  });

  factory Bosch.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'timestamp': String timestamp,
        'sensordatavalues[0].value': double pressure
      } =>
        Bosch(
          id: id,
          timestamp: timestamp,
          pressure: pressure,
        ),
      _ => throw const FormatException('Failed to load sensor data.'),
    };
  }
}
