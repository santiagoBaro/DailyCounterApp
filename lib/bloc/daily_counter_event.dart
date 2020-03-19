part of 'daily_counter_bloc.dart';

@immutable
abstract class DailyCounterEvent {
  DailyCounterEvent([List props = const <dynamic>[]]);
}

class LoadNewDate extends DailyCounterEvent {
  final DayValues values;

  LoadNewDate(this.values);
}

class UpdateValues extends DailyCounterEvent {
  final DayValues values;

  UpdateValues(this.values);
}

class AddWater extends DailyCounterEvent {
  final int ammount;

  AddWater(this.ammount);
}

class AddCarbs extends DailyCounterEvent {
  final int ammount;

  AddCarbs(this.ammount);
}
