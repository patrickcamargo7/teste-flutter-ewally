import 'package:json_annotation/json_annotation.dart';

part 'balance_model.g.dart';

@JsonSerializable()
class BalanceModel {
	@JsonKey(name: 'balance')
	double balance;
	@JsonKey(name: 'blockedBalance')
	double blockedBalance;

	BalanceModel({this.balance, this.blockedBalance});

	factory BalanceModel.fromJson(Map<String, dynamic> json) {
		return _$BalanceModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$BalanceModelToJson(this);
}
