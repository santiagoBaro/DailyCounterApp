part of 'daily_counter_bloc.dart';

abstract class DailyCounterState extends Equatable {
  const DailyCounterState();
}

class DailyCounterInitial extends DailyCounterState {
  @override
  List<Object> get props => [];
}
