import 'package:json_annotation/json_annotation.dart';

part 'authorization_model.g.dart';

@JsonSerializable()
class AuthorizationModel {
	@JsonKey(name: 'token')
	String token;

	AuthorizationModel({this.token});

	factory AuthorizationModel.fromJson(Map<String, dynamic> json) {
		return _$AuthorizationModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$AuthorizationModelToJson(this);
}
