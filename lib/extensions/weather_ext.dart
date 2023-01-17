import 'package:flutter_bloc_implementation/extensions/temperature_ext.dart';
import 'package:flutter_bloc_implementation/screens/weather/models/weather.dart';

extension WeatherFormat on Weather {
  String formattedTemperature(TemperatureUnits units) {
    return '''${temperature.value.toStringAsPrecision(2)}°${units.isCelsius ? 'C' : 'F'}''';
  }
}
