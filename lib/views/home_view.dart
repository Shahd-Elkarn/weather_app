import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_current_weather_cubit/get_current_weather_cubit.dart';
import 'package:weather_app/cubits/get_current_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/no_weather_info.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Weather App"),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SearchView(),
              ),
            );
          },
          icon: const Icon(Icons.search),
        ),
      ),
      body: BlocBuilder<GetCurrentWeatherCubit, GetWeatherStates>(
        builder: (context, state) {
          if(state is NoWeatherState){
            return const NoWeatherInfo();
          }
          else if(state is WeatherLoadedState){
            return WeatherInfoBody(weather: state.weatherModel!);
            //return  WeatherInfoBody();
          }
          else{
            return const Text("OOps there is error , Try later...");
          }
        },
      ),
    );
  }
}
