part of 'weather_cubit.dart';

abstract class WeatherState extends Equatable {
  final Weather? weather;
  final TemperatureUnits? temperatureUnits;
  final String? message;

  const WeatherState({
    this.weather,
    this.temperatureUnits,
    this.message,
  });

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {
  const WeatherInitial() : super();
}

class WeatherLoading extends WeatherState {
  const WeatherLoading() : super();
}

class WeatherSuccess extends WeatherState {
  const WeatherSuccess({
    Weather? weather,
    TemperatureUnits temperatureUnits = TemperatureUnits.celius,
  }) : super(
          weather: weather,
          temperatureUnits: temperatureUnits,
        );
}

class WeatherFailed extends WeatherState {
  const WeatherFailed({String? message}) : super(message: message);
}
