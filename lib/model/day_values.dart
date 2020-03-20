import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

import 'chart_value.dart';

part 'day_values.g.dart';

@JsonSerializable()
class DayValues {
  final String day;
  int waterIntake;
  int carbsIntake;
  final List<ChartValue> waterIntakeLastWeek;
  final List<ChartValue> carbsIntakeLastWeek;

  DayValues({
    @required this.day,
    @required this.waterIntake,
    @required this.carbsIntake,
    @required this.carbsIntakeLastWeek,
    @required this.waterIntakeLastWeek,
  });

  double waterIntakePerc() {
    return waterIntake * 100 / 3500;
  }

  double carbsIntakePerc() {
    return carbsIntake * 100 / 20;
  }

  factory DayValues.fromJson(Map<String, dynamic> json) =>
      _$DayValuesFromJson(json);

  Map<String, dynamic> toJson() => _$DayValuesToJson(this);
}
