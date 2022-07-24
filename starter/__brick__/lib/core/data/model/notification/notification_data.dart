import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:{{package_name}}/core/utils/json_custom_parser.dart';
part '../../../../gen/core/data/model/notification/notification_data.g.dart';

@JsonSerializable()
@JsonIntToBool()
class NotificationData extends Equatable {
  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime? updatedat;

  @JsonKey(name: 'users_id')
  final String? userId;

  @JsonKey(name: 'type')
  final String? type;

  @JsonKey(name: 'title')
  final String? title;

  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'parent_id')
  final String? parentId;

  @JsonKey(name: 'parent_detail')
  final String? parentDetail;

  @JsonKey(name: 'is_read')
  final bool? isRead;

  const NotificationData({
    this.id,
    this.createdAt,
    this.updatedat,
    this.userId,
    this.type,
    this.title,
    this.description,
    this.parentId,
    this.parentDetail,
    this.isRead,
    this.message,
  });

  factory NotificationData.fromJson(Map<String, dynamic> json) =>
      _$NotificationDataFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationDataToJson(this);

  @override
  List<Object?> get props => [
        id,
        createdAt,
        updatedat,
        userId,
        type,
        title,
        parentId,
        message,
      ];
}
