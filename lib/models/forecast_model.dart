class ForecastModel {
  final String day;
  final String temperature;
  final String wind;
  ForecastModel({
    required this.day,
    required this.temperature,
    required this.wind,
  });

  static ForecastModel fromMap(map) {
    return ForecastModel(
      day: map['day'] ?? '',
      temperature: map['temperature'] ?? '',
      wind: map['wind'] ?? '',
    );
  }
}
