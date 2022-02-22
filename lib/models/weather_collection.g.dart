// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherCollection _$WeatherCollectionFromJson(Map<String, dynamic> json) =>
    WeatherCollection(
      json['weather'] as List<dynamic>,
      MainData.fromJson(json['main'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherCollectionToJson(WeatherCollection instance) =>
    <String, dynamic>{
      'weather': instance.weather,
      'main': instance.main,
    };
