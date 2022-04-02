import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../datasource/interfaces/iweather_datasource_interface.dart';
import '../../../repository/weather_repository.dart';
import '../../error/app_error.dart';
import '../../models/weather_model.dart';
import '../components/container/container_sucess.dart';
import '../store/weather_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late WeatherStore store;
  late final WeatherRepository repository;
  late IWeatherDataSource datasource;
  late WeatherModel model;

  late final Dio dio;
  @override
  void initState() {
    super.initState();

    model = WeatherModel(
      description: '',
      forecast: [],
      temperature: '',
      wind: '',
    );
    datasource = WeatherDataSourceDio(dio);
    repository = WeatherRepository(datasource);
    store = WeatherStore(repository, model);
    store.featchWeather();
  }

  @override
  Widget build(BuildContext context) {
    // pega o tamanho da tela do celular
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              store.getImagens(),
              fit: BoxFit.cover,
            ),
            ScopedBuilder<WeatherStore, AppError, WeatherModel>(
              onError: (context, error) =>
                  Center(child: Text(error?.mensage ?? 'Error desconhecido')),
              store: store,
              onState: (_, state) {
                return ContainerWeatherForecast(
                  store: store,
                  size: size,
                );
              },
              onLoading: (__) => Container(
                width: size.width,
                height: size.height,
                color: Colors.black.withOpacity(0.3),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: const CircularProgressIndicator(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
