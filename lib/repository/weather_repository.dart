import '../datasource/interfaces/iweather_datasource_interface.dart';
import '../models/weather_model.dart';

class WeatherRepository {
  final IWeatherDataSource dataSource;

  WeatherRepository(this.dataSource);

  Future<WeatherModel> getWeattherForecast(String city) async {
    try {
      Map<String, dynamic> result = await dataSource.getWeatherForecast(city);
      final weather = WeatherModel.fromMap(result);
      return weather;
    } catch (e) {
      rethrow;
    }
  }
}
