import 'package:json_annotation/json_annotation.dart';

part 'login_information.g.dart';

@JsonSerializable()
class LoginInformation {
  final String token;
  final bool setup;

  LoginInformation({required this.token, required this.setup});

  factory LoginInformation.fromJson(Map<String, dynamic> json) =>
      _$LoginInformationFromJson(json);

  Map<String, dynamic> toJson() => _$LoginInformationToJson(this);
}
