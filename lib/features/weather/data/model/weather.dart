import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable(explicitToJson: true)
class WeatherResponse {
  final Location location;
  final WeatherData weather;

  WeatherResponse({
    required this.location,
    required this.weather,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherResponseToJson(this);
}

@JsonSerializable()
class Location {
  final String city;
  final double latitude;
  final double longitude;

  Location({
    required this.city,
    required this.latitude,
    required this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@JsonSerializable()
class WeatherData {
  final double temperature;
  @JsonKey(name: 'feels_like')
  final double feelsLike;
  final String condition;
  @JsonKey(name: 'risk_factor')
  final int riskFactor;
  @JsonKey(name: 'precipitation_probability')
  final int precipitationProbability;
  @JsonKey(name: 'wind_speed')
  final double windSpeed;
  @JsonKey(name: 'wind_direction')
  final String windDirection;
  @JsonKey(name: 'atm_pressure')
  final int atmPressure;
  final int humidity;

  WeatherData({
    required this.temperature,
    required this.feelsLike,
    required this.condition,
    required this.riskFactor,
    required this.precipitationProbability,
    required this.windSpeed,
    required this.windDirection,
    required this.atmPressure,
    required this.humidity,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDataToJson(this);

  // Helper method to get weather icon based on condition
  String getWeatherIcon() {
    switch (condition.toLowerCase()) {
      case 'rainy':
        return '🌧️';
      case 'sunny':
        return '☀️';
      case 'cloudy':
        return '☁️';
      case 'stormy':
        return '⛈️';
      case 'snowy':
        return '❄️';
      default:
        return '🌈';
    }
  }

  // Helper method to get wind direction description
  String getWindDirectionDescription() {
    switch (windDirection) {
      case 'N':
        return 'North';
      case 'NE':
        return 'Northeast';
      case 'E':
        return 'East';
      case 'SE':
        return 'Southeast';
      case 'S':
        return 'South';
      case 'SW':
        return 'Southwest';
      case 'W':
        return 'West';
      case 'NW':
        return 'Northwest';
      default:
        return windDirection;
    }
  }

  // Helper method to get risk factor description
  String getRiskFactorDescription() {
    switch (riskFactor) {
      case 0:
        return 'Low Risk';
      case 1:
        return 'Moderate Risk';
      case 2:
        return 'High Risk';
      default:
        return 'Unknown Risk';
    }
  }
}

// Extension for temperature conversion
extension TemperatureConverter on double {
  double toCelsius() => this;
  double toFahrenheit() => (this * 9 / 5) + 32;
}
