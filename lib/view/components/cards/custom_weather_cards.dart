import 'package:flutter/material.dart';

class CustomWeatherCard extends StatelessWidget {
  final String day;

  final String temperature;
  final String wind;
  final double height;
  final double width;
  const CustomWeatherCard({
    Key? key,
    this.day = '',
    this.temperature = '',
    this.wind = '',
    this.height = 150,
    this.width = 250,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: height,
      width: width,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Dia $day',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          const Icon(
            Icons.wb_cloudy,
            color: Colors.white,
          ),
          Text(
            temperature,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          Text(
            wind,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
