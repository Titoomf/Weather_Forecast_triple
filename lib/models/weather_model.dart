import 'forecast_model.dart';

class WeatherModel {
  final String temperature;
  final String wind;
  final String description;
  final List<ForecastModel> forecast;
  WeatherModel({
    required this.temperature,
    required this.wind,
    required this.description,
    required this.forecast,
  });

  static WeatherModel fromMap(map) {
    return WeatherModel(
      temperature: map['temperature'] ?? '',
      wind: map['wind'] ?? '',
      description: map['description'] ?? '',
      forecast: (map['forecast'] as List)
          .map(
            (e) => ForecastModel.fromMap(e),
          )
          .toList(),
    );
  }
}
