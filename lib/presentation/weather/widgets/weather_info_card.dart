import 'package:flutter/material.dart';

class WeatherInfoCard extends StatelessWidget {
  final String title;
  final String value;

  const WeatherInfoCard({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(16),
        width: 120,
        height: 80,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              value,
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ],
        ),
      ),
    );
  }
}
