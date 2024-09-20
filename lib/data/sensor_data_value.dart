class Sensordatavalue {
  final String valueType;
  final String value;
  final int id;

  Sensordatavalue({
    required this.valueType,
    required this.value,
    required this.id,
  });

  factory Sensordatavalue.fromJson(Map<String, dynamic> json) =>
      Sensordatavalue(
        valueType: json["value_type"],
        value: json["value"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "value_type": valueType,
        "value": value,
        "id": id,
      };
}
