import 'package:json_annotation/json_annotation.dart';

part 'menu.g.dart';

@JsonSerializable()
class Menu {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'image_url')
  final String imageUrl;

  @JsonKey(name: 'num_calorie')
  final double numCalorie;

  @JsonKey(name: 'num_carbohydrate')
  final double numCarbohydrate;

  @JsonKey(name: 'num_protein')
  final double numProtein;

  @JsonKey(name: 'num_fat')
  final double numFat;

  Menu({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.numCalorie,
    required this.numCarbohydrate,
    required this.numProtein,
    required this.numFat,
  });

  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);

  Map<String, dynamic> toJson() => _$MenuToJson(this);
}
