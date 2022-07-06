import 'package:json_annotation/json_annotation.dart';

part 'user_information.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'avatar_url')
  final String avatarUrl;
  
  @JsonKey(name: "gender")
  final String gender;

  @JsonKey(name: "birthdate")
  final DateTime birthdate;

  @JsonKey(name: "height")
  final double height;

  @JsonKey(name: "weight")
  final double weight;

  @JsonKey(name: "desired_wight")
  final double desiredWight;

  User(this.gender, this.birthdate, this.height, this.weight, this.desiredWight,
      {required this.name, required this.email, required this.avatarUrl});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
