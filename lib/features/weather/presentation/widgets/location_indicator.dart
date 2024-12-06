import 'package:comp_app/features/weather/bloc/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationIndicator extends StatelessWidget {
  const LocationIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        alignment: Alignment.topCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.place_outlined,
              color: Colors.white,
            ),
            BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                if (state is WeatherInitial || state is WeatherLoading) {
                  return Text(
                    "Loading",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }
                if (state is WeatherSuccess) {
                  return Text(
                    state.weatherData.location.city,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                } else {
                  return Text("Eror");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
