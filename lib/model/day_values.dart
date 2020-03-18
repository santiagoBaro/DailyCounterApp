import 'package:json_annotation/json_annotation.dart';

part 'day_values.g.dart';

@JsonSerializable()
class DayValues {
  String day;
  int waterIntake;
  int carbsIntake;

  DayValues({
    this.day,
    this.waterIntake,
    this.carbsIntake,
  });

  int waterIntakePerc() {
    return waterIntake * 100 ~/ 3500;
  }

  int carbsIntakePerc() {
    return carbsIntake * 100 ~/ 20;
  }

  factory DayValues.fromJson(Map<String, dynamic> json) =>
      _$DayValuesFromJson(json);

  Map<String, dynamic> toJson() => _$DayValuesToJson(this);
}
