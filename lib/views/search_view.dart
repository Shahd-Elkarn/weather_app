import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_current_weather_cubit/get_current_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
        actions: const [
          Icon(Icons.search),
          SizedBox(
            width: 8,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: TextField(
            onSubmitted: (value) {
              log(value);
            var getWeatherCubit = BlocProvider.of<GetCurrentWeatherCubit>(context);
            getWeatherCubit.getWeather(cityName: value);

            Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              labelText: "Search",
              hintText: "Enter city name",
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
// http://api.weatherapi.com/v1/current.json?key=7ec9118fa4e34ebe84b125017242409&q=London&aqi=no
// http://api.weatherapi.com/v1/current.json?key=7ec9118fa4e34ebe84b125017242409&q=cairo&aqi=yes
// https://api.weatherapi.com/v1/forecast.json?key=7ec9118fa4e34ebe84b125017242409&q=cairo&days=1

