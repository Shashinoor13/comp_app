import 'package:comp_app/features/weather/bloc/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeelsLike extends StatelessWidget {
  const FeelsLike({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherSuccess) {
            return Text(
              "Feels Like ${state.weatherData.weather.feelsLike}",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            );
          }
          if (state is WeatherFaliure) {
            return Text(state.message);
          }
          if (state is WeatherLoading) return const Text("Loading");
          return const Text("Something went wrong");
        },
      ),
    );
  }
}
