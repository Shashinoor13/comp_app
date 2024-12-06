import 'package:comp_app/features/weather/bloc/weather_bloc.dart';
import 'package:comp_app/features/weather/presentation/widgets/additional_details.dart';
import 'package:comp_app/features/weather/presentation/widgets/circular_decorator.dart';
import 'package:comp_app/features/weather/presentation/widgets/feels_like.dart';
import 'package:comp_app/features/weather/presentation/widgets/location_indicator.dart';
import 'package:comp_app/features/weather/presentation/widgets/rain_data.dart';
import 'package:comp_app/features/weather/presentation/widgets/recommended_places.dart';
import 'package:comp_app/features/weather/presentation/widgets/suggestion.dart';
import 'package:comp_app/features/weather/presentation/widgets/temperature_details.dart';
import 'package:comp_app/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WeatherBloc>()
        ..add(
          GetWeather(),
        ),
      child: Scaffold(
        body: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            return Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: MediaQuery.of(context).orientation ==
                              Orientation.landscape
                          ? Alignment.bottomCenter
                          : Alignment.center,
                      colors: state is WeatherSuccess
                          ? (state.weatherData.weather.condition == "Sunny"
                              ? [
                                  const Color.fromARGB(255, 253, 151, 42),
                                  Colors.white
                                ]
                              : state.weatherData.weather.condition == "Rainy"
                                  ? [Colors.grey, Colors.black]
                                  : [Colors.blue, Colors.white])
                          : [Colors.blue, Colors.white],
                    ),
                  ),
                ),
                const CircularDecorator(
                  top: -90,
                  right: -120,
                ),
                const CircularDecorator(
                  left: -50,
                  top: 150,
                  size: 100,
                ),
                Positioned(
                  top: 130,
                  right: -90,
                  child: Image.asset("assets/christmas_tree.png"),
                ),
                Positioned(
                  left: -70,
                  bottom: 60,
                  child: Image.asset(
                    "assets/snowman.png",
                    height: 200,
                  ),
                ),
                const SafeArea(
                  child: SingleChildScrollView(
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 20),
                          LocationIndicator(),
                          SizedBox(height: 20),
                          TemperatureDetails(),
                          SizedBox(height: 10),
                          FeelsLike(),
                          SizedBox(height: 20),
                          AdditionalDetails(),
                          SizedBox(height: 20),
                          Suggestion(),
                          RecommendedPlaces(),
                          RainData()
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
