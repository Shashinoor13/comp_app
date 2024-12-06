import 'package:comp_app/features/weather/bloc/weather_bloc.dart';
import 'package:comp_app/features/weather/presentation/screen/weather_page.dart';
import 'package:comp_app/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WeatherBloc>(),
      child: MaterialApp(
        title: 'Mobile Rush',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const WeatherPage(),
      ),
    );
  }
}
