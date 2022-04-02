import 'package:flutter/material.dart';

import '../../store/weather_store.dart';

class CustomTextField extends StatelessWidget {
  final WeatherStore store;

  const CustomTextField({
    Key? key,
    required this.store,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          store.getIcons(),
          size: 75,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            store.model!.description,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            store.model!.temperature,
            style: const TextStyle(
              fontSize: 50,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            store.city,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 40,
            ),
          ),
        ),
      ],
    );
  }
}
