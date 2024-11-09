import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_current_weather_cubit/get_current_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weathe_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({key, required this.weather}) : super(key: key);
  final WeatheModel weather;

  @override
  Widget build(BuildContext context) {
    WeatheModel weatheModel =
        BlocProvider.of<GetCurrentWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            getThemeColor(weatheModel.weatherCondition),
            getThemeColor(weatheModel.weatherCondition)[300]!,
            getThemeColor(weatheModel.weatherCondition)[50]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatheModel.cityName,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
                "Upadated at ${weatheModel.date.hour}:${weatheModel.date.minute}"),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.network("https:${weatheModel.image}"),
                Text(
                  weatheModel.avgTemp.toStringAsFixed(0),
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  children: [
                    Text("max temp: ${weatheModel.mxTemp.round()}"),
                    Text("min temp: ${weatheModel.mnTemp.round()}"),
                  ],
                )
              ],
            ),
            Text(
              weatheModel.weatherCondition,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

DateTime stringToDateTime(String value) {
  return DateTime.parse(value);
}
