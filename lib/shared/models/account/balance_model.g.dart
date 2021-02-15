// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BalanceModel _$BalanceModelFromJson(Map<String, dynamic> json) {
  return BalanceModel(
    balance: (json['balance'] as num)?.toDouble(),
    blockedBalance: (json['blockedBalance'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$BalanceModelToJson(BalanceModel instance) =>
    <String, dynamic>{
      'balance': instance.balance,
      'blockedBalance': instance.blockedBalance,
    };
