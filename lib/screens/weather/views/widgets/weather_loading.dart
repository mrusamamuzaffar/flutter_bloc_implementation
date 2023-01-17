import 'package:flutter/material.dart';

class WeatherLoadingView extends StatelessWidget {
  const WeatherLoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          '⛅',
          style: TextStyle(fontSize: 64),
        ),
        Text(
          'Loading Weather',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const Padding(
          padding: EdgeInsets.all(16),
          child: CircularProgressIndicator(),
        ),
      ],
    );
  }
}
