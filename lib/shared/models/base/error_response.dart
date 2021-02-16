import 'package:json_annotation/json_annotation.dart';

part 'error_response.g.dart';

@JsonSerializable()
class ErrorResponse {
	@JsonKey(name: 'code')
	int code;
	@JsonKey(name: 'msg')
	String msg;

	ErrorResponse({this.code, this.msg});

	factory ErrorResponse.fromJson(Map<String, dynamic> json) {
		return _$ErrorResponseFromJson(json);
	}

	Map<String, dynamic> toJson() => _$ErrorResponseToJson(this);
}
