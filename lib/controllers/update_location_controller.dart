import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';
import '../models/main_data.dart';
import '../models/weather_collection.dart';
import '../models/weather_data.dart';

class UpdateLocationController extends GetxController {
  late WeatherCollection _weatherCollection;
  late WeatherData _weatherData;
  late MainData _mainData;

  static double lat = 53.494931;
  static double long = -113.616038;

  late String weatherUrl;

  void incrementLatitude() {
    lat += 0.1;
    update();
  }

  void incrementLongitude() {
    long += 3;
    update();
  }

  Future<WeatherCollection> getData(BuildContext context) async {
    late WeatherCollection data;

    weatherUrl =
        "http://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&units=${Constants.units}&appid=${Constants.weatherApiKey}";

    var url = Uri.parse(weatherUrl);
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonData = response.body;
      final parsedJson = jsonDecode(jsonData);

      data = WeatherCollection.fromJson(parsedJson);
    } else {
      // Error loading data
    }

    return data;
  }
}
