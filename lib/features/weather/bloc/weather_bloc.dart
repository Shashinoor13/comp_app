import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:comp_app/features/weather/data/data_source/remote/weather_remote_datasource.dart';
import 'package:comp_app/features/weather/data/model/weather.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRemoteDatasource _remoteDatasource;
  WeatherBloc(this._remoteDatasource) : super(WeatherInitial()) {
    on<GetWeather>(_onFetchWeather);
  }

  FutureOr<void> _onFetchWeather(event, emit) async {
    try {
      emit(WeatherLoading());
      final weatherData = await _remoteDatasource.getCurrentWeather();
      emit(WeatherSuccess(weatherData));
    } catch (e) {
      emit(WeatherFaliure(e.toString()));
    }
  }
}
