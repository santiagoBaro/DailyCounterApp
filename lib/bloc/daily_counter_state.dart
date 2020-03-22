//part of 'daily_counter_bloc.dart';
import 'package:dailycounter_hydrated_bloc/model/day_values.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class DailyCounterState extends Equatable {
  DailyCounterState([List props = const []]) : super(props);
}

class DailyCounterInitial extends DailyCounterState {}

class DailyCounterLoading extends DailyCounterState {}

class DailyCounterLoaded extends DailyCounterState {
  final DayValues values;

  DailyCounterLoaded(this.values) : super([values]);
}
