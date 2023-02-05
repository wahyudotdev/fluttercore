import 'package:json_annotation/json_annotation.dart';
part '../../../gen/core/data/model/api_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> {
  @JsonKey(defaultValue: 0)
  final int status;

  @JsonKey(defaultValue: 'message')
  final String message;

  @JsonKey(name: 'error')
  final String? error;

  final T data;

  ApiResponse(this.status, this.message, this.error, this.data);

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$ApiResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(
    Object Function(T value) toJsonT,
  ) =>
      _$ApiResponseToJson(this, toJsonT);
}
