import 'package:flutter/material.dart';
import 'package:flutter_bloc_implementation/extensions/weather_ext.dart';
import 'package:flutter_bloc_implementation/screens/weather/models/weather.dart';

class WeatherSuccessView extends StatelessWidget {
  final Weather weather;
  final TemperatureUnits units;
  const WeatherSuccessView({
    Key? key,
    required this.weather,
    required this.units,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          weather.location,
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontWeight: FontWeight.w200,
              ),
        ),
        Text(
          weather.formattedTemperature(units),
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
          '''Last Updated at ${TimeOfDay.fromDateTime(weather.lastUpdated).format(context)}''',
        ),
      ],
    );
  }
}
