import 'package:flutter/cupertino.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../repository/weather_repository.dart';
import '../../models/forecast_model.dart';
import '../../models/weather_model.dart';
import '../../shared/error/app_error.dart';
import '../../shared/weather_icons_icons.dart';

// ignore: must_be_immutable
class WeatherStore extends NotifierStore<AppError, WeatherModel> {
  final WeatherRepository repository;
  WeatherModel? model;
  String city = 'Laguna';

  List<ForecastModel>? forecast;

  WeatherStore(
    this.repository,
    this.model,
  ) : super(
          WeatherModel(
            temperature: '',
            wind: '',
            description: '',
            forecast: [],
          ),
        );

  Future featchWeather() async {
    setLoading(true);
    try {
      model = await repository.getWeattherForecast(city);

      if (model != null) {
        update(model!);
      } else {
        setError(AppError(mensage: 'Nenhuma dados para mostrar'));
      }
    } on AppError catch (e) {
      setError(e);
    }
    setLoading(false);
  }

  void onChange(value) {
    city = value;
  }

  String getImagens() {
    if (model!.description == 'Sunny') {
      return 'assets/images/sunny.png';
    } else if (model!.description == 'Partly cloudy') {
      return 'assets/images/nublado.png';
    } else if (model!.description == 'Patchy rain possible') {
      return 'assets/images/clear.png';
    } else {
      return 'assets/images/chuva_leve.png';
    }
  }

  IconData getIcons() {
    if (model!.description == 'Sunny') {
      return WeatherIcons.sun;
    } else if (model!.description == 'Partly cloudy') {
      return WeatherIcons.cloudSun;
    } else if (model!.description == 'Patchy rain possible') {
      return WeatherIcons.drizzle;
    } else {
      return WeatherIcons.sun;
    }
  }
}
