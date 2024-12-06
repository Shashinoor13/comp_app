import 'package:comp_app/core/constants/constants.dart';
import 'package:comp_app/core/network/network.dart';
import 'package:comp_app/features/weather/bloc/weather_bloc.dart';
import 'package:comp_app/features/weather/data/data_source/remote/weather_remote_datasource.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<NetworkHandler>(
      () => NetworkHandler(baseUrl: kWeatherAPI));

  getIt.registerFactory<WeatherRemoteDatasource>(
      () => WeatherRemoteDatasource(getIt<NetworkHandler>()));

  getIt.registerFactory<WeatherBloc>(
      () => WeatherBloc(getIt<WeatherRemoteDatasource>()));
}
