// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../core/data/model/user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      name: json['name'] as String?,
      profilePhoto: json['profile_photo'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'profile_photo': instance.profilePhoto,
      'created_at': instance.createdAt?.toIso8601String(),
    };
