import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_implementation/screens/weather/cubit/weather_cubit.dart';
import 'package:flutter_bloc_implementation/screens/weather/models/weather.dart';
import 'package:flutter_bloc_implementation/screens/weather/views/widgets/weather_error.dart';
import 'package:flutter_bloc_implementation/screens/weather/views/widgets/weather_loading.dart';
import 'package:flutter_bloc_implementation/screens/weather/views/widgets/weather_success.dart';

class WeatherView extends StatefulWidget {
  const WeatherView({Key? key}) : super(key: key);

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  @override
  void initState() {
    super.initState();

    context.read<WeatherCubit>().fetch('Islamabad');
  }

  @override
  Widget build(BuildContext context) {
    return const WeatherPage();
  }
}

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Bloc'),
        actions: [
          IconButton(
            onPressed: () => context.read<WeatherCubit>().refresh(),
            icon: const Icon(
              Icons.refresh,
            ),
          )
        ],
      ),
      body: Center(
        child: BlocConsumer<WeatherCubit, WeatherState>(
          listener: (context, state) {
            if (state is WeatherInitial) {
              debugPrint('Initial State');
            }
            if (state is WeatherFailed) {
              debugPrint('Weather failed!');
            }
          },
          builder: (context, state) {
            if (state is WeatherLoading) {
              return const WeatherLoadingView();
            } else if (state is WeatherFailed) {
              return const WeatherErrorView();
            } else if (state is WeatherSuccess) {
              return WeatherSuccessView(
                weather: state.weather!,
                units: TemperatureUnits.celius,
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
