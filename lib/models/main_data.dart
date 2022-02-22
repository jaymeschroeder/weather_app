import 'package:json_annotation/json_annotation.dart';

part 'main_data.g.dart';

@JsonSerializable()
class MainData {
  double temp;
  double feels_like;
  double temp_min;
  double temp_max;
  double pressure;
  double humidity;

  MainData(
      {required this.temp,
      required this.feels_like,
      required this.temp_min,
      required this.temp_max,
      required this.pressure,
      required this.humidity});

  factory MainData.fromJson(Map<String, dynamic> json) => _$MainDataFromJson(json);

  Map<String, dynamic> toJson() => _$MainDataToJson(this);
}
