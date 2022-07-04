import 'package:json_annotation/json_annotation.dart';

part 'user_information.g.dart';

@JsonSerializable()
class User {
  final String name;
  final String email;
  final String password;
  final String avatarUrl;

  User(
      {required this.name,
      required this.email,
      required this.password,
      required this.avatarUrl});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
