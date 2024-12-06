import 'package:comp_app/core/network/network.dart';
import 'package:comp_app/features/weather/data/model/weather.dart';

class WeatherRemoteDatasource {
  final NetworkHandler _networkHandler;

  WeatherRemoteDatasource(this._networkHandler);

  Future<WeatherResponse> getCurrentWeather() async {
    try {
      final response = await _networkHandler.get('/weather');
      return WeatherResponse.fromJson(response);
    } catch (e) {
      throw Exception('Failed to fetch weather data: $e');
    }
  }
}
