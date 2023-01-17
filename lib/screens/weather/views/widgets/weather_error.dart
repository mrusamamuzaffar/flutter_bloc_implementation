import 'package:flutter/material.dart';

class WeatherErrorView extends StatelessWidget {
  const WeatherErrorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('🙈', style: TextStyle(fontSize: 64)),
        Text(
          'Something went wrong!',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ],
    );
  }
}
