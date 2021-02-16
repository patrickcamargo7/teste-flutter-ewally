// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatementModel _$StatementModelFromJson(Map<String, dynamic> json) {
  return StatementModel(
    id: json['id'] as int,
    accountName: json['accountName'] as String,
    amount: (json['amount'] as num)?.toDouble(),
    balance: (json['balance'] as num)?.toDouble(),
    createdAt: json['createdAt'] as String,
    operationType: json['operationType'] as String,
    status: json['status'] as String,
    otherInfo: json['otherInfo'] == null
        ? null
        : OtherInfoModel.fromJson(json['otherInfo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$StatementModelToJson(StatementModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'accountName': instance.accountName,
      'amount': instance.amount,
      'balance': instance.balance,
      'createdAt': instance.createdAt,
      'operationType': instance.operationType,
      'status': instance.status,
      'otherInfo': instance.otherInfo,
    };
