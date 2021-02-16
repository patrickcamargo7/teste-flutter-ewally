// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'other_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtherInfoModel _$OtherInfoModelFromJson(Map<String, dynamic> json) {
  return OtherInfoModel(
    otherAccountName: json['otherAccountName'] as String,
    userLatitude: (json['userLatitude'] as num)?.toDouble(),
    userLongitude: (json['userLongitude'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$OtherInfoModelToJson(OtherInfoModel instance) =>
    <String, dynamic>{
      'otherAccountName': instance.otherAccountName,
      'userLatitude': instance.userLatitude,
      'userLongitude': instance.userLongitude,
    };
