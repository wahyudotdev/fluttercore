// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../../core/data/model/notification/notification_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationData _$NotificationDataFromJson(Map<String, dynamic> json) =>
    NotificationData(
      id: json['id'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedat: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      userId: json['users_id'] as String?,
      type: json['type'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      parentId: json['parent_id'] as String?,
      parentDetail: json['parent_detail'] as String?,
      isRead: const JsonIntToBool().fromJson(json['is_read']),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$NotificationDataToJson(NotificationData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedat?.toIso8601String(),
      'users_id': instance.userId,
      'type': instance.type,
      'title': instance.title,
      'message': instance.message,
      'description': instance.description,
      'parent_id': instance.parentId,
      'parent_detail': instance.parentDetail,
      'is_read': const JsonIntToBool().toJson(instance.isRead),
    };
