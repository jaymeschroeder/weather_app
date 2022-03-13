import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/models/weather_data.dart';

import 'main_data.dart';

part 'weather_collection.g.dart';

@JsonSerializable()
class WeatherCollection {
  final List<dynamic> weather;
  final MainData main;

  WeatherCollection(this.weather, this.main);

  WeatherData getWeatherData() => WeatherData(
      id: weather[0]["id"],
      main: weather[0]["main"],
      description: weather[0]["description"],
      icon: weather[0]["icon"]);

  factory WeatherCollection.fromJson(Map<String, dynamic> json) => _$WeatherCollectionFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherCollectionToJson(this);
}
