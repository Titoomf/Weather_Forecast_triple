import 'package:flutter/material.dart';

import '../view/pages/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather Forecast',
      routes: {
        '/': (context) => const HomePage(),
      },
    );
  }
}
