import 'package:json_annotation/json_annotation.dart';

import 'other_info_model.dart';

part 'statement_model.g.dart';

@JsonSerializable()
class StatementModel {
	@JsonKey(name: 'id')
	String id;
	@JsonKey(name: 'amount')
  double amount;
	@JsonKey(name: 'balance')
	double balance;
	@JsonKey(name: 'createdAt')
	String createdAt;
	@JsonKey(name: 'operationType')
	String operationType;
	@JsonKey(name: 'otherInfo')
	OtherInfoModel otherInfo;

	StatementModel({
		this.id,
		this.amount,
		this.balance,
		this.createdAt,
		this.operationType,
		this.otherInfo,
	});

	factory StatementModel.fromJson(Map<String, dynamic> json) {
		return _$StatementModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$StatementModelToJson(this);
}
