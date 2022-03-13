import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:weather_app/screens/main_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  static double lat = 53.494931;
  static double long = -113.616038;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Weather App",
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MainPage(),
    );
  }
}
