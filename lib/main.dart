import 'package:flutter/material.dart';
import 'package:weather_app/presentaion/screens/home/home_screen.dart';


import 'core/utils/theme/theme.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
