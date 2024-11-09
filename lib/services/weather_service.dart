import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weathe_model.dart';

class WeatherService {
  final Dio dio;

  WeatherService({required this.dio});
  final String baseUrl = "https://api.weatherapi.com/v1";
  final String apiKey = "7ec9118fa4e34ebe84b125017242409";

  Future<WeatheModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get("$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1");

      WeatheModel weatheModel = WeatheModel.fromJson(response.data);

      return weatheModel;
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['error']['message'] ?? 'Oopps , try later';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('Oopps , try later');
    }
  }
}
