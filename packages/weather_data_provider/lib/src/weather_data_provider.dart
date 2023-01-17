import 'dart:convert';

import 'package:weather_data_provider/weather_data_provider.dart';
import 'package:http/http.dart' as http;

// A Typical data provider layer that we usually have, calling of APIs and getting data
class WeatherDataProvider {
  static const _baseUrlWeather = 'api.open-meteo.com';
  static const _baseUrlGeocoding = 'geocoding-api.open-meteo.com';

  Future<Location> getLocation(String name) async {
    final locationRequest = Uri.https(
      _baseUrlGeocoding,
      '/v1/search',
      {
        'name': name,
        'count': '1',
      },
    );

    final response = await http.get(locationRequest);

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body) as Map;
      final results = body['results'] as List;

      return Location.fromMap(results.first);
    }
    throw 'Failed to get location';
  }

  Future<Weather> getWeather(double lat, double lng) async {
    final weatherRequest = Uri.https(
      _baseUrlWeather,
      'v1/forecast',
      {
        'latitude': '$lat',
        'longitude': '$lng',
        'current_weather': 'true',
      },
    );

    final response = await http.get(weatherRequest);

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body) as Map;
      final result = body['current_weather'];

      return Weather.fromMap(result);
    }
    throw 'Failed to get weather';
  }
}
