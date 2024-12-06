// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherResponse _$WeatherResponseFromJson(Map<String, dynamic> json) =>
    WeatherResponse(
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      weather: WeatherData.fromJson(json['weather'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherResponseToJson(WeatherResponse instance) =>
    <String, dynamic>{
      'location': instance.location.toJson(),
      'weather': instance.weather.toJson(),
    };

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      city: json['city'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'city': instance.city,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

WeatherData _$WeatherDataFromJson(Map<String, dynamic> json) => WeatherData(
      temperature: (json['temperature'] as num).toDouble(),
      feelsLike: (json['feels_like'] as num).toDouble(),
      condition: json['condition'] as String,
      riskFactor: (json['risk_factor'] as num).toInt(),
      precipitationProbability:
          (json['precipitation_probability'] as num).toInt(),
      windSpeed: (json['wind_speed'] as num).toDouble(),
      windDirection: json['wind_direction'] as String,
      atmPressure: (json['atm_pressure'] as num).toInt(),
      humidity: (json['humidity'] as num).toInt(),
    );

Map<String, dynamic> _$WeatherDataToJson(WeatherData instance) =>
    <String, dynamic>{
      'temperature': instance.temperature,
      'feels_like': instance.feelsLike,
      'condition': instance.condition,
      'risk_factor': instance.riskFactor,
      'precipitation_probability': instance.precipitationProbability,
      'wind_speed': instance.windSpeed,
      'wind_direction': instance.windDirection,
      'atm_pressure': instance.atmPressure,
      'humidity': instance.humidity,
    };
