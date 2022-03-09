import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/domain/weather/entities/weather_details.dart';

typedef OnTap = void Function();

class WeatherListItem extends StatelessWidget {
  final WeatherDetails weatherDetails;
  final DateTime date;
  final OnTap onTap;

  const WeatherListItem(
      {Key? key,
      required this.weatherDetails,
      required this.date,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(weatherDetails.main),
        isThreeLine: true,
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(weatherDetails.description),
            const SizedBox(
              height: 4,
            ),
            Text(DateFormat('dd MMM yyyy HH:mm').format(date)),
          ],
        ),
        trailing: CachedNetworkImage(
          imageUrl: weatherDetails.icon,
          width: 48,
          height: 48,
        ),
        onTap: onTap,
      ),
    );
  }
}
