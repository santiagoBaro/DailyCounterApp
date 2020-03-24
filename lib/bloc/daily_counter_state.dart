//part of 'daily_counter_bloc.dart';
import 'package:dailycounter_hydrated_bloc/model/day_values.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class DailyCounterState extends Equatable {
  DailyCounterState([List props = const []]) : super(props);
}

class InitialState extends DailyCounterState {}

class LoadingState extends DailyCounterState {}

class LoadedState extends DailyCounterState {
  final DayValues values;

  LoadedState(this.values) : super([values]);
}
