part of 'daily_counter_bloc.dart';

@immutable
abstract class DailyCounterEvent extends Equatable {
  DailyCounterEvent([List props = const <dynamic>[]]);
}

class LoadNewDate extends DailyCounterEvent {
  final DayValues oldValues;

  LoadNewDate(this.oldValues) : super([oldValues]);
}

class UpdateValues extends DailyCounterEvent {
  final DayValues values;

  UpdateValues(this.values) : super([values]);
}

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
