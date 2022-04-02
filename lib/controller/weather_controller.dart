import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../models/weather_model.dart';
import '../repository/weather_repository.dart';
import '../shared/weather_icons_icons.dart';

part 'weather_controller.g.dart';

class WeatherController = WeatherControllerBase with _$WeatherController;

abstract class WeatherControllerBase with Store {
  final WeatherRepository repository;

  @observable
  String city = 'Laguna';

  WeatherControllerBase({
    required this.repository,
  });

  @action
  Future<void> getClimaRepository() async {
    final modelClima = await repository.getWeattherForecast(city);
    if (modelClima == null) {
      throw (Exception('model clima veio nulo'));
    } else {
      model = modelClima;
    }
  }

  @observable
  WeatherModel model = WeatherModel(
    temperature: '',
    wind: '',
    description: '',
    forecast: [],
  );

  void onChange(value) {
    city = value;
  }

  String getImagens() {
    if (model.description == 'Sunny') {
      return 'assets/images/sunny.png';
    } else if (model.description == 'Partly cloudy') {
      return 'assets/images/nublado.png';
    } else if (model.description == 'Patchy rain possible') {
      return 'assets/images/clear.png';
    } else {
      return 'assets/images/chuva_leve.png';
    }
  }

  IconData getIcons() {
    if (model.description == 'Sunny') {
      return WeatherIcons.sun;
    } else if (model.description == 'Partly cloudy') {
      return WeatherIcons.cloudSun;
    } else if (model.description == 'Patchy rain possible') {
      return WeatherIcons.drizzle;
    } else {
      return WeatherIcons.cloud;
    }
  }
}
