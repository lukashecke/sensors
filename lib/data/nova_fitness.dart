class NovaFitness {
  final int id;
  final String timestamp;

  const NovaFitness({
    required this.id,
    required this.timestamp,
  });

  factory NovaFitness.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'timestamp': String timestamp,
      } =>
        NovaFitness(
          id: id,
          timestamp: timestamp,
        ),
      _ => throw const FormatException('Failed to load sensor data.'),
    };
  }
}
