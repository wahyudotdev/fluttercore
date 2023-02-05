import 'package:json_annotation/json_annotation.dart';
part '../../../gen/core/data/model/user.g.dart';

@JsonSerializable()
class User {
  final String? name;

  @JsonKey(name: 'profile_photo')
  final String? profilePhoto;

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  User({this.name, this.profilePhoto, this.createdAt});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
