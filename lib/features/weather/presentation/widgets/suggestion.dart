import 'package:comp_app/features/weather/bloc/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Suggestion extends StatelessWidget {
  const Suggestion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const conditionMapping = {
      "Rainy": {
        "1": "Might Rain",
        "2": "Drizzle",
        "3": "Chances of rain",
        "4": "Rain is due",
        "5": "High Chances of storm",
        "message": "Carry an umbrella",
      },
      "Sunny": {
        "1": "Clear Sky",
        "2": "Bright and Sunny",
        "3": "Warm Day",
        "4": "Hot Day",
        "5": "Extreme Heat",
        "message": "Apply Sunscreen",
      },
      "Snowy": {
        "1": "Light Snow",
        "2": "Snow Showers",
        "3": "Snowfall",
        "4": "Heavy Snow",
        "5": "Blizzard",
        "message": "Wear warm clothes",
      },
    };
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherSuccess) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${conditionMapping[state.weatherData.weather.condition]![state.weatherData.weather.riskFactor.toString()]!} ",
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                conditionMapping[state.weatherData.weather.condition]![
                    "message"]!,
                style: const TextStyle(
                    color: Colors.orange,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              )
            ],
          );
        }
        if (state is WeatherLoading) {
          return const Text("Weather Data Loading");
        } else {
          return (const Text("Somethign went wrong"));
        }
      },
    );
  }
}
