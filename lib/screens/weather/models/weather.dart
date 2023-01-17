import 'dart:convert';
import 'package:weather_repository/weather_repository.dart'
    as weather_repository;

enum TemperatureUnits { fahrenheit, celius }

class Temperature {
  final double value;
  const Temperature({
    required this.value,
  });

  Map<String, dynamic> toMap() {
    return {
      'value': value,
    };
  }

  factory Temperature.fromMap(Map<String, dynamic> map) {
    return Temperature(
      value: map['value'] as double,
    );
  }

  factory Temperature.fromJson(String source) =>
      Temperature.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Temperature(value: $value)';
}

class Weather {
  final DateTime lastUpdated;
  final String location;
  final Temperature temperature;
  const Weather({
    required this.lastUpdated,
    required this.location,
    required this.temperature,
  });

  static final empty = Weather(
    lastUpdated: DateTime(100),
    location: 'N/A',
    temperature: const Temperature(value: 0.0),
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'lastUpdated': lastUpdated.millisecondsSinceEpoch,
      'location': location,
      'temperature': temperature.toMap(),
    };
  }

  // A method that basically gives Weather (Model in this layer) by
  // converting Weather (Model from Repository layer)
  factory Weather.fromRepository(weather_repository.Weather weather) {
    return Weather(
      lastUpdated: DateTime.now(),
      location: weather.location,
      temperature: Temperature(value: weather.temp),
    );
  }

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      lastUpdated:
          DateTime.fromMillisecondsSinceEpoch(map['lastUpdated'] as int),
      location: map['location'] as String,
      temperature:
          Temperature.fromMap(map['temperature'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Weather.fromJson(String source) =>
      Weather.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Weather(lastUpdated: $lastUpdated, location: $location, temperature: $temperature)';
}
