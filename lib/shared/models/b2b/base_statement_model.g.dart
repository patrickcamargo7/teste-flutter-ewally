// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_statement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseStatementModel _$BaseStatementModelFromJson(Map<String, dynamic> json) {
  return BaseStatementModel(
    statement: (json['statement'] as List)
        ?.map((e) => e == null
            ? null
            : StatementModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$BaseStatementModelToJson(BaseStatementModel instance) =>
    <String, dynamic>{
      'statement': instance.statement,
    };
