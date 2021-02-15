// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'other_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtherInfoModel _$OtherInfoModelFromJson(Map<String, dynamic> json) {
  return OtherInfoModel(
    senderAccount: json['senderAccount'] as String,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$OtherInfoModelToJson(OtherInfoModel instance) =>
    <String, dynamic>{
      'senderAccount': instance.senderAccount,
      'description': instance.description,
    };
