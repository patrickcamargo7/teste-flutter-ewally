import 'package:json_annotation/json_annotation.dart';
import 'package:teste_ewally/shared/models/b2b/statement_model.dart';
import 'package:charts_flutter/flutter.dart' as charts;

part 'base_statement_model.g.dart';

@JsonSerializable()
class BaseStatementModel {
  @JsonKey(name: 'statement')
  List<StatementModel> statement;

  BaseStatementModel({this.statement});

  factory BaseStatementModel.fromJson(Map<String, dynamic> json) {
    return _$BaseStatementModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BaseStatementModelToJson(this);
}
