import 'package:json_annotation/json_annotation.dart';

part 'auth_data_model.g.dart';

@JsonSerializable()
class AuthDataModel {
  @JsonKey(name: 'username')
  String username;
  @JsonKey(name: 'password')
  String password;

  AuthDataModel({this.username, this.password});

  factory AuthDataModel.fromJson(Map<String, dynamic> json) {
    return _$AuthDataModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AuthDataModelToJson(this);
}
