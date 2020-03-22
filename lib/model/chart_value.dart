import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chart_value.g.dart';

@JsonSerializable()
class ChartValue extends Equatable {
  final String date;
  final int ammount;

  ChartValue({
    @required this.date,
    @required this.ammount,
  }) : super([date, ammount]);

  factory ChartValue.fromJson(Map<String, dynamic> json) =>
      _$ChartValueFromJson(json);
  Map<String, dynamic> toJson() => _$ChartValueToJson(this);
}
