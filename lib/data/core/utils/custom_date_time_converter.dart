import 'package:json_annotation/json_annotation.dart';

class CustomDateTimeConverter implements JsonConverter<DateTime, int> {
  const CustomDateTimeConverter();

  @override
  DateTime fromJson(int json) {
    return DateTime.fromMillisecondsSinceEpoch(json * 1000).toLocal();
  }

  @override
  int toJson(DateTime json) => json.millisecondsSinceEpoch;
}