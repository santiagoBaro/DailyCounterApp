part of 'daily_counter_bloc.dart';

@immutable
abstract class DailyCounterState {
  DailyCounterState([List props = const []]);
}

class DailyCounterInitial extends DailyCounterState {}

class DailyCounterLoading extends DailyCounterState {}

class DailyCounterLoaded extends DailyCounterState {
  final DayValues values;

  DailyCounterLoaded(this.values);
}
