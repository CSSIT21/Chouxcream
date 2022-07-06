import 'package:json_annotation/json_annotation.dart';

part 'progress.g.dart';

@JsonSerializable()
class Progress {
  @JsonKey(name: 'calories_graph')
  final List<double> caloriesGraph;

  @JsonKey(name: 'intake_calorie')
  final double intakeCalorie;

  @JsonKey(name: 'max_calorie')
  final double maxCalorie;

  @JsonKey(name: 'intake_protein')
  final double intakeProtein;

  @JsonKey(name: 'max_protein')
  final double maxProtein;

  @JsonKey(name: 'intake_carbohydrate')
  final double intakeCarbohydrate;

  @JsonKey(name: 'max_carbohydrate')
  final double maxCarbohydrate;

  @JsonKey(name: 'intake_fat')
  final double intakeFat;

  @JsonKey(name: 'max_fat')
  final double maxFat;

  Progress({
    required this.caloriesGraph,
    required this.intakeCalorie,
    required this.maxCalorie,
    required this.intakeProtein,
    required this.maxProtein,
    required this.intakeCarbohydrate,
    required this.maxCarbohydrate,
    required this.intakeFat,
    required this.maxFat,
  });

  factory Progress.fromJson(Map<String, dynamic> json) => _$ProgressFromJson(json);

  Map<String, dynamic> toJson() => _$ProgressToJson(this);
}
