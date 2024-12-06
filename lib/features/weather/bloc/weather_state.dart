part of 'weather_bloc.dart';

@immutable
sealed class WeatherState extends Equatable {
  @override
  List<Object> get props => [];
}

final class WeatherInitial extends WeatherState {}

final class WeatherLoading extends WeatherState {}

final class WeatherSuccess extends WeatherState {
  final WeatherResponse weatherData;
  WeatherSuccess(this.weatherData);

  @override
  List<Object> get props => [weatherData];
}

final class WeatherFaliure extends WeatherState {
  final String message;
  WeatherFaliure(this.message);

  @override
  List<Object> get props => [message];
}
