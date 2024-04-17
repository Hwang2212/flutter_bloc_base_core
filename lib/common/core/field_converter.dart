import 'package:json_annotation/json_annotation.dart';

class DateTimeUtc implements JsonConverter<DateTime?, String> {
  const DateTimeUtc();

  @override
  String toJson(DateTime? value) {
    return value?.toIso8601String() ?? '';
  }

  @override
  DateTime? fromJson(String jsonString) {
    DateTime.parse(jsonString);
    return DateTime.tryParse(jsonString);
  }
}

class HttpStringCheck implements JsonConverter<String?, String> {
  const HttpStringCheck();

  @override
  String toJson(String? value) {
    if (value?.isEmpty ?? true) {
      return '';
    }
    final url = Uri.parse(value!).replace(scheme: '').toString().substring(2);

    return url;
  }

  @override
  String? fromJson(String value) {
    final url = Uri.parse(value).replace(scheme: '').toString().substring(2);

    return url;
  }
}
