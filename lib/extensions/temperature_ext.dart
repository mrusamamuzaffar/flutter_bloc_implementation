import 'package:flutter_bloc_implementation/screens/weather/models/weather.dart';

extension TempX on TemperatureUnits {
  bool get isCelsius => this == TemperatureUnits.celius;
  bool get isFahrenheit => this == TemperatureUnits.fahrenheit;
}
