import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_current_weather_cubit/get_current_weather_cubit.dart';
import 'package:weather_app/cubits/get_current_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetCurrentWeatherCubit(),
      child: Builder(
        builder: (context) {
          return BlocBuilder<GetCurrentWeatherCubit, GetWeatherStates>(
            builder: (context, state) {
              final themeColor = getThemeColor(
                BlocProvider.of<GetCurrentWeatherCubit>(context)
                    .weatherModel
                    ?.weatherCondition,
              );

              return MaterialApp(
                theme: ThemeData(
                  primaryColor: themeColor,
                  appBarTheme: AppBarTheme(
                    backgroundColor: themeColor,
                    iconTheme: const IconThemeData(color: Colors.white),
                    titleTextStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                debugShowCheckedModeBanner: false,
                home: const HomeView(),
              );
            },
          );
        },
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case "Sunny":
      return Colors.amber;
    case "Clear":
    case "Mist":
    case "Fog":
    case "Moderate snow":
    case "Moderate or heavy snow showers":
    case "Freezing fog":
    case "Freezing drizzle":
    case "Heavy freezing drizzle":
      return Colors.blueGrey;

    case "Cloudy":
    case "Partly cloudy":
    case "Overcast":
    case "Blizzard":
    case "Heavy snow":
    case "Patchy heavy snow":
      return Colors.grey;
    case "Patchy rain possible":
    case "Light drizzle":
    case "Patchy light rain":
    case "Light rain":
    case "Light rain shower":
    case "Moderate rain":
    case "Moderate rain at times":
    case "Moderate or heavy rain shower":
    case "Patchy snow possible":
    case "Light snow":
    case "Patchy light snow":
    case "Light snow showers":
      return Colors.lightBlue;

    case "Heavy rain":
    case "Torrential rain shower":
      return Colors.indigo;

    case "Ice pellets":
    case "Light sleet":
    case "Light sleet showers":
    case "Patchy freezing drizzle possible":
      return Colors.cyan;
    case "Thundery outbreaks possible":
    case "Patchy light rain with thunder":
    case "Moderate or heavy rain with thunder":
      return Colors.deepPurple;

    default:
      return Colors.blue;
  }
}
