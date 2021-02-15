import 'package:json_annotation/json_annotation.dart';

part 'other_info_model.g.dart';

@JsonSerializable()
class OtherInfoModel {
  @JsonKey(name: 'senderAccount')
  String senderAccount;
  @JsonKey(name: 'description')
  String description;

  OtherInfoModel({this.senderAccount, this.description});

  factory OtherInfoModel.fromJson(Map<String, dynamic> json) {
    return _$OtherInfoModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OtherInfoModelToJson(this);
}
