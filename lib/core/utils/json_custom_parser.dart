import 'package:json_annotation/json_annotation.dart';

class JsonStringToInt implements JsonConverter<int, dynamic> {
  const JsonStringToInt();

  @override
  int fromJson(dynamic json) {
    if (json is num) {
      return json.toInt();
    }
    return int.tryParse(json) ?? 0;
  }

  @override
  String toJson(int object) => object.toString();
}

class JsonStringToDouble implements JsonConverter<double, dynamic> {
  const JsonStringToDouble();

  @override
  double fromJson(json) {
    if (json is num) {
      return json.toDouble();
    }
    return double.tryParse(json) ?? .0;
  }

  @override
  toJson(double object) => object.toString();
}

class JsonStringToIntNullable implements JsonConverter<int?, dynamic> {
  const JsonStringToIntNullable();

  @override
  int? fromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    if (json is num) {
      return json.toInt();
    }
    return int.tryParse(json);
  }

  @override
  String toJson(int? object) => object.toString();
}

class JsonStringToDoubleNullable implements JsonConverter<double?, dynamic> {
  const JsonStringToDoubleNullable();

  @override
  double? fromJson(json) {
    if (json == null) {
      return null;
    }
    if (json is num) {
      return json.toDouble();
    }
    return double.tryParse(json);
  }

  @override
  toJson(double? object) => object.toString();
}

class JsonIntToBool implements JsonConverter<bool?, dynamic> {
  const JsonIntToBool();
  @override
  bool? fromJson(json) {
    if (json is num) {
      return json.toInt() == 1;
    }
    if (json is String) {
      return json == 'true';
    }
    return json as bool?;
  }

  @override
  toJson(bool? object) => object.toString();
}
