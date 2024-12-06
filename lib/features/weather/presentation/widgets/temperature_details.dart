import 'package:comp_app/features/weather/bloc/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class TemperatureDetails extends StatelessWidget {
  const TemperatureDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitial || state is WeatherLoading) {
            return Text("Loading");
          }

          if (state is WeatherFaliure) {
            return Text(state.message);
          }
          if (state is WeatherSuccess) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Text(
                      state.weatherData.weather.temperature.toString() + "°C",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: 100,
                  width: 3,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(80, 255, 255, 255),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          state.weatherData.weather.condition,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Icon(
                          Icons.cloud,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    Text(
                      DateFormat('EEEE,d MMMM').format(DateTime.now()),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            );
          } else {
            return Text("Something Went Wrong");
          }
        },
      ),
    );
  }
}
