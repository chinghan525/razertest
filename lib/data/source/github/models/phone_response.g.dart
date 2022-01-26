// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Phone _$PhoneFromJson(Map<String, dynamic> json) {
  return Phone(
    mobile: json['mobile'] as String,
    home: json['home'] as String,
    office: json['office'] as String,
  );
}

Map<String, dynamic> _$PhoneToJson(Phone instance) => <String, dynamic>{
      'mobile': instance.mobile,
      'home': instance.home,
      'office': instance.office,
    };
