import 'package:flutter/material.dart';

import '../../store/weather_store.dart';
import '../cards/custom_weather_cards.dart';
import '../textfield/custom_text_field.dart';
import '../textformfield/custom_text_form_field.dart';

class ContainerWeatherForecast extends StatelessWidget {
  final Size size;
  final WeatherStore store;

  const ContainerWeatherForecast({
    Key? key,
    required this.size,
    required this.store,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height,
      width: size.width,
      color: Colors.black45,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                // //tamanho do meu TextFormField
                height: size.height * 0.090,
                width: size.width * 0.6,
                child: CustomTextFormField(
                  store: store,
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {
                  store.featchWeather();
                  FocusScope.of(context).unfocus();
                },
              )
            ],
          ),
          CustomTextField(
            store: store,
          ),
          Container(
            // tamanho do container debaixo
            height: size.height * 0.23,
            width: size.width * 0.95,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: Colors.black45,
            ),
            alignment: Alignment.center,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: store.model!.forecast.length,
              itemBuilder: (context, index) {
                final forecast = store.model!.forecast[index];
                return CustomWeatherCard(
                  height: size.height * 0.15,
                  width: size.width * 0.30,
                  day: forecast.day,
                  temperature: forecast.temperature,
                  wind: forecast.wind,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
