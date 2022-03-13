class WeatherData {
  int? id;
  String? main;
  String? description;
  String? icon;

  bool isInitialized(){
    return id != null;
  }

  WeatherData({this.id, this.main, this.description, this.icon});
}
