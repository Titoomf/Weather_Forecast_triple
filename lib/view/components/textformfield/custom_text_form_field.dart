import 'package:flutter/material.dart';

import '../../store/weather_store.dart';

class CustomTextFormField extends StatelessWidget {
  final WeatherStore store;

  const CustomTextFormField({
    Key? key,
    required this.store,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: TextCapitalization.words,
      style: const TextStyle(
        color: Colors.white,
      ),
      onChanged: store.onChange,
      decoration: InputDecoration(
        labelText: 'Cidade',
        labelStyle: const TextStyle(
          color: Colors.white,
          fontSize: 15,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade400,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade600,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
