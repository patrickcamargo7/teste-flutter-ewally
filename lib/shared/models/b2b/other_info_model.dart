import 'package:json_annotation/json_annotation.dart';

part 'other_info_model.g.dart';

@JsonSerializable()
class OtherInfoModel {
	@JsonKey(name: 'otherAccountName')
	String otherAccountName;
	@JsonKey(name: 'userLatitude')
	double userLatitude;
	@JsonKey(name: 'userLongitude')
	double userLongitude;

	OtherInfoModel({
		this.otherAccountName,
		this.userLatitude,
		this.userLongitude,
	});

	factory OtherInfoModel.fromJson(Map<String, dynamic> json) {
		return _$OtherInfoModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$OtherInfoModelToJson(this);
}
