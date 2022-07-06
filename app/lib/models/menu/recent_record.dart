import 'package:chouxcream_app/models/menu/record.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recent_record.g.dart';

@JsonSerializable()
class RecentRecord {
  @JsonKey(name: 'calorie')
  final double calorie;

  @JsonKey(name: 'bmr')
  final double bmr;

  @JsonKey(name: 'records')
  final List<Record> records;

  RecentRecord({
    required this.calorie,
    required this.bmr,
    required this.records,
  });

  factory RecentRecord.fromJson(Map<String, dynamic> json) => _$RecentRecordFromJson(json);

  Map<String, dynamic> toJson() => _$RecentRecordToJson(this);
}
