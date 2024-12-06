import 'package:comp_app/features/weather/bloc/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdditionalDetails extends StatelessWidget {
  const AdditionalDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            offset: Offset(-10, 71),
            blurRadius: 20,
            spreadRadius: 0,
            color: Color.fromRGBO(219, 227, 251, 0.00),
          ),
          BoxShadow(
            offset: Offset(-6, 45),
            blurRadius: 18,
            spreadRadius: 0,
            color: Color.fromRGBO(219, 227, 251, 0.04),
          ),
          BoxShadow(
            offset: Offset(-4, 26),
            blurRadius: 15,
            spreadRadius: 0,
            color: Color.fromRGBO(219, 227, 251, 0.13),
          ),
          BoxShadow(
            offset: Offset(-2, 11),
            blurRadius: 11,
            spreadRadius: 0,
            color: Color.fromRGBO(219, 227, 251, 0.21),
          ),
          BoxShadow(
            offset: Offset(0, 3),
            blurRadius: 6,
            spreadRadius: 0,
            color: Color.fromRGBO(219, 227, 251, 0.25),
          ),
        ],
      ),
      child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherSuccess) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AdditionalTags(
                      icon: Icons.cloud,
                      percentValue: state
                          .weatherData.weather.precipitationProbability
                          .toString(),
                      labelText: "Precipitation",
                    ),
                    AdditionalTags(
                      icon: Icons.air,
                      percentValue:
                          state.weatherData.weather.windSpeed.toString(),
                      labelText: "Wind Pressure",
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AdditionalTags(
                      icon: Icons.gas_meter,
                      percentValue:
                          state.weatherData.weather.atmPressure.toString(),
                      labelText: "Wind Pressure",
                    ),
                    AdditionalTags(
                      icon: Icons.water,
                      percentValue:
                          state.weatherData.weather.windSpeed.toString(),
                      labelText: "Wind Pressure",
                    )
                  ],
                ),
              ],
            );
          }
          if (state is WeatherLoading) {
            return const Text("Loading");
          } else {
            return const Text("Something went wrong");
          }
        },
      ),
    );
  }
}

class AdditionalTags extends StatelessWidget {
  final IconData icon;
  final String percentValue;
  final String labelText;

  const AdditionalTags({
    super.key,
    required this.icon,
    required this.percentValue,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.blue.shade200,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon),
        ),
        SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              percentValue,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              labelText,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}
