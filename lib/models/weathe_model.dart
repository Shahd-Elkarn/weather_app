class WeatheModel {
  final String cityName;
  final DateTime date;
  final String? image;
  final double avgTemp;
  final double mnTemp;
  final double mxTemp;
  final String weatherCondition;

  WeatheModel(
      {required this.cityName,
      required this.date,
      this.image,
      required this.avgTemp,
      required this.mnTemp,
      required this.mxTemp,
      required this.weatherCondition});
  factory WeatheModel.fromJson(json) {
    return WeatheModel(
      cityName: json["location"]["name"],
      date: DateTime.parse( json["current"]["last_updated"]),
      avgTemp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
      mnTemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
      mxTemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
      weatherCondition: json["forecast"]["forecastday"][0]["day"]["condition"]
          ["text"],
      image: json["forecast"]["forecastday"][0]["day"]["condition"]["icon"],
    );
  }
}
