part of 'daily_counter_bloc.dart';

@immutable
abstract class DailyCounterState extends Equatable {
  DailyCounterState([List props = const []]) : super(props);
}

class DailyCounterInitial extends DailyCounterState {}

class DailyCounterLoading extends DailyCounterState {}

class DailyCounterLoaded extends DailyCounterState {
  final DayValues values;

  DailyCounterLoaded({@required this.values}) : super([values]);
}
