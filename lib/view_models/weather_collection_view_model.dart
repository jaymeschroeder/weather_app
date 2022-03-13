import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';
import '../models/weather_collection.dart';

final weatherCollectionProvider = StateNotifierProvider<WeatherCollectionViewModel, AsyncValue<WeatherCollection>>(
    (ref) => WeatherCollectionViewModel());

class WeatherCollectionViewModel extends StateNotifier<AsyncValue<WeatherCollection>> {
  double _lat = 53.494931;
  double _long = -113.616038;

  late String weatherUrl;

  WeatherCollectionViewModel() : super(const AsyncValue.loading()) {
    if (kDebugMode) {
      print("loading");
    }
    getData();
  }

  double get lat => _lat;

  double get long => _long;

  Future<void> getData() async {
    state = const AsyncValue.loading();

    weatherUrl =
        "http://api.openweathermap.org/data/2.5/weather?lat=$_lat&lon=$_long&units=${Constants.units}&appid=${Constants.weatherApiKey}";

    var url = Uri.parse(weatherUrl);
    http.Response response = await http.get(url);

    final jsonData = response.body;
    final parsedJson = jsonDecode(jsonData);

    state = AsyncValue.data(WeatherCollection.fromJson(parsedJson));
  }

  updateLatitude(double lat) {
    _lat = lat;

    getData();
  }

  updateLongitude(double long) {
    _long = long;

    getData();
  }
}
