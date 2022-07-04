import 'package:json_annotation/json_annotation.dart';

part 'login_information.g.dart';

@JsonSerializable()
class LoginInformation {
  @JsonKey(name: 'token')
  final String token;

  @JsonKey(name: 'preference_settled')
  final bool preferenceSettled;

  LoginInformation({required this.token, required this.preferenceSettled});

  factory LoginInformation.fromJson(Map<String, dynamic> json) => _$LoginInformationFromJson(json);

  Map<String, dynamic> toJson() => _$LoginInformationToJson(this);
}
