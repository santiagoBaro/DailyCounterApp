part of 'daily_counter_bloc.dart';

@immutable
abstract class DailyCounterEvent {
  DailyCounterEvent([List props = const <dynamic>[]]);
}

class LoadNewDate extends DailyCounterEvent {
  final DayValues oldValues;

  LoadNewDate(this.oldValues);
}

class UpdateValues extends DailyCounterEvent {
  final DayValues values;

  UpdateValues(this.values);
}

class AddWater extends DailyCounterEvent {
  final int ammount;
  final DayValues values;

  AddWater(
    this.ammount,
    this.values,
  );
}

class AddCarbs extends DailyCounterEvent {
  final int ammount;
  final DayValues values;

  AddCarbs(
    this.ammount,
    this.values,
  );
}
