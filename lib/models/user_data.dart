import 'package:json_annotation/json_annotation.dart';

part 'user_data.g.dart';

@JsonSerializable(nullable: false)
class UserData {
  final String displayName;
  final String email;
  final DateTime birthday;
  final String gender;
  UserData({this.displayName, this.email, this.birthday, this.gender});
  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}