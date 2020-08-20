// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) {
  return $checkedNew('UserData', json, () {
    final val = UserData(
      displayName: $checkedConvert(json, 'displayName', (v) => v as String),
      email: $checkedConvert(json, 'email', (v) => v as String),
      birthday: $checkedConvert(json, 'birthday',
          (v) => v == null ? null : DateTime.parse(v as String)),
      gender: $checkedConvert(json, 'gender', (v) => v as String),
    );
    return val;
  });
}

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'email': instance.email,
      'displayName': instance.displayName,
      'birthday': instance.birthday?.toIso8601String(),
      'gender': instance.gender,
    };
