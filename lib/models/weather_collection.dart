import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/models/weather_data.dart';

import 'main_data.dart';

part 'weather_collection.g.dart';

@JsonSerializable()
class WeatherCollection {
  List<dynamic> weather;
  MainData main;

  WeatherCollection(this.weather, this.main);

  WeatherData getWeatherData() {
    return WeatherData(
        id: weather[0]["id"],
        main: weather[0]["main"],
        description: weather[0]["description"],
        icon: weather[0]["icon"]);
  }

  MainData getMainData() {
    return main;
  }

  factory WeatherCollection.fromJson(Map<String, dynamic> json) => _$WeatherCollectionFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherCollectionToJson(this);
}
