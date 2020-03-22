import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

@immutable
class ChartValue extends Equatable {
  final String date;
  final int ammount;

  ChartValue({
    @required this.date,
    @required this.ammount,
  }) : super([date, ammount]);
}
