import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_current_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weathe_model.dart';
import 'package:weather_app/services/weather_service.dart';

class GetCurrentWeatherCubit extends Cubit<GetWeatherStates> {
  GetCurrentWeatherCubit() : super(NoWeatherState());
  
   WeatheModel? weatherModel;

  getWeather({required String cityName}) async {
    try {
        weatherModel = await WeatherService(dio: Dio())
          .getCurrentWeather(cityName: cityName);
      emit(WeatherLoadedState(weatherModel: weatherModel),);
    } catch (e) {
      emit(WeatherFailtureState(errorMessage: e.toString()));
    }
  }
}
