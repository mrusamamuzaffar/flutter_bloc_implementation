import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_implementation/screens/weather/cubit/weather_cubit.dart';
import 'package:flutter_bloc_implementation/screens/weather/views/weather_view.dart';
import 'package:weather_repository/weather_repository.dart';
import 'configs/core_theme.dart' as theme;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MyApp(weatherRepository: WeatherRepository()),
  );
}

class MyApp extends StatelessWidget {
  final WeatherRepository _weatherRepository;

  const MyApp({super.key, required WeatherRepository weatherRepository})
      : _weatherRepository = weatherRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _weatherRepository,
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Bloc Implementation',
      theme: theme.themeLight,
      home: BlocProvider(
        create: (_) => WeatherCubit(context.read<WeatherRepository>()),
        child: const WeatherView(),
      ),
    );
  }
}
