import 'package:dio/dio.dart';

import '../../shared/error/app_error.dart';

abstract class IWeatherDataSource {
  // onde so faz o contratro , outra classe faz o chamado do contrado e faz a logica
  Future<Map<String, dynamic>> getWeatherForecast(String city);
}

class WeatherDataSourceDio implements IWeatherDataSource {
  final Dio dio;

  WeatherDataSourceDio(this.dio);
  @override
  Future<Map<String, dynamic>> getWeatherForecast(String city) async {
    try {
      final response =
          await dio.get('https://goweather.herokuapp.com/weather/$city');
      return response.data;
    } on DioError catch (e) {
      throw AppError(
        mensage: e.error,
      );
    }
  }
}
