import 'package:weather_app/models/weathe_model.dart';

class GetWeatherStates {}

class NoWeatherState extends GetWeatherStates {}

class WeatherLoadedState extends GetWeatherStates {
  final WeatheModel? weatherModel;

  WeatherLoadedState({this.weatherModel});
}

class WeatherFailtureState extends GetWeatherStates {
  final String errorMessage;

  WeatherFailtureState({required this.errorMessage});
}
