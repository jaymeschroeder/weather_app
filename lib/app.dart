import 'package:flutter/material.dart';
import 'package:weather_app/pages/main_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  static double lat = 53.494931;
  static double long = -113.616038;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Weather App",
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MainPage(),
    );
  }
}
