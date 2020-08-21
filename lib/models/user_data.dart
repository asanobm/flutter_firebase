import 'package:json_annotation/json_annotation.dart';

part 'user_data.g.dart';

@JsonSerializable(nullable: true)
class UserData {
  final String email;
  final String displayName;
  final DateTime birthday;
  final String gender;
  UserData({this.displayName, this.email, this.birthday, this.gender});
  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}