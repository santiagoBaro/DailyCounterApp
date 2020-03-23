import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

import 'chart_value.dart';

part 'day_values.g.dart';

@JsonSerializable()
class DayValues extends Equatable {
  final int dailyWaterTarget;
  final String day;
  final int waterIntake;
  final int carbsIntake;
  final List<ChartValue> waterIntakeLastWeek;
  final List<ChartValue> carbsIntakeLastWeek;

  DayValues({
    @required this.dailyWaterTarget,
    @required this.day,
    @required this.waterIntake,
    @required this.carbsIntake,
    @required this.carbsIntakeLastWeek,
    @required this.waterIntakeLastWeek,
  });

  double waterIntakePerc() {
    return waterIntake * 100 / dailyWaterTarget;
  }

  double carbsIntakePerc() {
    return carbsIntake * 100 / 20;
  }

  factory DayValues.fromJson(Map<String, dynamic> json) =>
      _$DayValuesFromJson(json);

  Map<String, dynamic> toJson() => _$DayValuesToJson(this);
}
