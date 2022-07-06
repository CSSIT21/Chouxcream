import 'package:json_annotation/json_annotation.dart';

part 'record.g.dart';

@JsonSerializable()
class Record {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'menu_name')
  final String menuName;

  @JsonKey(name: 'menu_image_url')
  final String menuImageUrl;

  @JsonKey(name: 'meal')
  final String meal;

  @JsonKey(name: 'calorie')
  final double calorie;

  @JsonKey(name: 'protein')
  final double protein;

  @JsonKey(name: 'carbohydrate')
  final double carbohydrate;

  @JsonKey(name: 'fat')
  final double fat;

  Record(
    this.menuName,
    this.menuImageUrl,
    this.meal,
    this.calorie,
    this.protein,
    this.carbohydrate,
    this.fat, {
    required this.id,
  });

  factory Record.fromJson(Map<String, dynamic> json) => _$RecordFromJson(json);

  Map<String, dynamic> toJson() => _$RecordToJson(this);
}
