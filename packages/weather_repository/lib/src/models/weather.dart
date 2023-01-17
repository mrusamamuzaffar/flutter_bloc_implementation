import 'dart:convert';

class Weather {
  final String location;
  final double temp;
  Weather({
    required this.location,
    required this.temp,
  });

  Weather copyWith({
    String? location,
    double? temp,
  }) {
    return Weather(
      location: location ?? this.location,
      temp: temp ?? this.temp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'location': location,
      'temp': temp,
    };
  }

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      location: map['location'] as String,
      temp: map['temp'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Weather.fromJson(String source) =>
      Weather.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Weather(location: $location, temp: $temp)';

  @override
  bool operator ==(covariant Weather other) {
    if (identical(this, other)) return true;

    return other.location == location && other.temp == temp;
  }

  @override
  int get hashCode => location.hashCode ^ temp.hashCode;
}
