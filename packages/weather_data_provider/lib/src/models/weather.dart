import 'dart:convert';

class Weather {
  final double temp;
  final int weatherCode;
  Weather({
    required this.temp,
    required this.weatherCode,
  });

  Weather copyWith({
    double? temp,
    int? weatherCode,
  }) {
    return Weather(
      temp: temp ?? this.temp,
      weatherCode: weatherCode ?? this.weatherCode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'temp': temp,
      'weathercode': weatherCode,
    };
  }

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      temp: map['temperature'] as double,
      weatherCode: map['weathercode'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Weather.fromJson(String source) =>
      Weather.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Weather(temp: $temp, weatherCode: $weatherCode)';

  @override
  bool operator ==(covariant Weather other) {
    if (identical(this, other)) return true;

    return other.temp == temp && other.weatherCode == weatherCode;
  }

  @override
  int get hashCode => temp.hashCode ^ weatherCode.hashCode;
}
