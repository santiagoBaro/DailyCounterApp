//part of 'daily_counter_bloc.dart';
import 'package:dailycounter_hydrated_bloc/model/day_values.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class DailyCounterEvent extends Equatable {
  DailyCounterEvent([List props = const <dynamic>[]]) : super(props);
}

class LoadNewDate extends DailyCounterEvent {
  final DayValues oldValues;

  LoadNewDate(this.oldValues) : super([oldValues]);
}

class InitializeValues extends DailyCounterEvent {}

class AddWater extends DailyCounterEvent {
  final int ammount;
  final DayValues values;

  AddWater(
    this.ammount,
    this.values,
  ) : super([
          ammount,
          values,
        ]);
}

class AddCarbs extends DailyCounterEvent {
  final int ammount;
  final DayValues values;

  AddCarbs(
    this.ammount,
    this.values,
  ) : super([
          ammount,
          values,
        ]);
}
