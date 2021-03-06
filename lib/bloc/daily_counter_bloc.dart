import 'dart:async';
import 'package:dailycounter_hydrated_bloc/model/chart_value.dart';
import 'package:intl/intl.dart';
import 'package:dailycounter_hydrated_bloc/model/day_values.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import '../model/day_values.dart';
import 'bloc.dart';

class DailyCounterBloc
    extends HydratedBloc<DailyCounterEvent, DailyCounterState> {
  @override
  DailyCounterState get initialState {
    return super.initialState ?? InitialState();
  }

  @override
  DailyCounterState fromJson(Map<String, dynamic> json) {
    try {
      final day = DayValues.fromJson(json);
      return LoadedState(day);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson(DailyCounterState state) {
    if (state is LoadedState) {
      return state.values.toJson();
    } else {
      return null;
    }
  }

  @override
  Stream<DailyCounterState> mapEventToState(
    DailyCounterEvent event,
  ) async* {
    if (event is InitializeValues) {
      //! InitializeValues
      yield LoadingState();
      var simplyfiedFormatter = new DateFormat('dd LLL');
      var formatter = new DateFormat('E dd LLL');
      var newDate = DateTime.now();

      // INITIALIZE CHART VALUES FOR THE LAST 7 DAYS
      List<ChartValue> waterHistory = [
        ChartValue(
          date: simplyfiedFormatter.format(newDate.add(Duration(days: -8))),
          ammount: 0,
        ),
        ChartValue(
          date: simplyfiedFormatter.format(newDate.add(Duration(days: -7))),
          ammount: 0,
        ),
        ChartValue(
          date: simplyfiedFormatter.format(newDate.add(Duration(days: -6))),
          ammount: 0,
        ),
        ChartValue(
          date: simplyfiedFormatter.format(newDate.add(Duration(days: -5))),
          ammount: 0,
        ),
        ChartValue(
          date: simplyfiedFormatter.format(newDate.add(Duration(days: -4))),
          ammount: 0,
        ),
        ChartValue(
          date: simplyfiedFormatter.format(newDate.add(Duration(days: -3))),
          ammount: 0,
        ),
        ChartValue(
          date: simplyfiedFormatter.format(newDate.add(Duration(days: -2))),
          ammount: 0,
        ),
      ];
      List<ChartValue> carbsHistory = [
        ChartValue(
          date: simplyfiedFormatter.format(newDate.add(Duration(days: -7))),
          ammount: 0,
        ),
        ChartValue(
          date: simplyfiedFormatter.format(newDate.add(Duration(days: -6))),
          ammount: 0,
        ),
        ChartValue(
          date: simplyfiedFormatter.format(newDate.add(Duration(days: -5))),
          ammount: 0,
        ),
        ChartValue(
          date: simplyfiedFormatter.format(newDate.add(Duration(days: -4))),
          ammount: 0,
        ),
        ChartValue(
          date: simplyfiedFormatter.format(newDate.add(Duration(days: -3))),
          ammount: 0,
        ),
        ChartValue(
          date: simplyfiedFormatter.format(newDate.add(Duration(days: -2))),
          ammount: 0,
        ),
        ChartValue(
          date: simplyfiedFormatter.format(newDate.add(Duration(days: -1))),
          ammount: 0,
        ),
      ];

      // INITIALIZES THE DAY VALUES TO THE CURRENT DAY
      // WITH INTAKE VALUES IN 0

      final DayValues day = DayValues(
        dailyWaterTarget: event.dailyWaterTarget,
        day: formatter.format(newDate).toString(),
        waterIntake: 0,
        carbsIntake: 0,
        waterIntakeLastWeek: waterHistory,
        carbsIntakeLastWeek: carbsHistory,
      );

      yield LoadedState(day);
    } else if (event is LoadNewDate) {
      //! LoadNewDate
      // THIS EVENT SETS THE STATE OF THE APP TO THE CURRENT DATE
      // INITIALIZEING THE INTAKE VALUES IN 0
      // AND UPDATES THE USERS HISTORY

      yield LoadingState();

      List<ChartValue> carbsHistory;
      List<ChartValue> waterHistory;
      waterHistory = event.oldValues.waterIntakeLastWeek;
      carbsHistory = event.oldValues.carbsIntakeLastWeek;

      // REMOVES OLDEST DATE VALUES
      waterHistory.removeAt(0);
      carbsHistory.removeAt(0);

      String simplypiedDate = event.oldValues.day.substring(3);
      // ADDS THE MOST RECENT DATE VALUES
      waterHistory.add(ChartValue(
        date: simplypiedDate,
        ammount: event.oldValues.waterIntake,
      ));
      carbsHistory.add(ChartValue(
        date: simplypiedDate,
        ammount: event.oldValues.carbsIntake,
      ));

      // CREATES A NEW DAY INITIALIZEING THE INTAKE VALUES IN 0
      // AND USING THE UPDATED HISTORY
      var formatter = new DateFormat('E dd LLL');
      var newDate = DateTime.now();
      final DayValues day = DayValues(
        dailyWaterTarget: event.oldValues.dailyWaterTarget,
        day: formatter.format(newDate).toString(),
        waterIntake: 0,
        carbsIntake: 0,
        waterIntakeLastWeek: waterHistory,
        carbsIntakeLastWeek: carbsHistory,
      );
      yield LoadedState(day);
    } else if (event is AddWater) {
      //! AddWater
      // THIS EVENT RECIVES THE OLD VALUES AND THE AMMOUNT OF WATER THE USER ADDED
      // AS THE VALUE CAN BE NEGATIVE, BUT THE TOTAL CANT, THERE IS A CHECK
      // THAT IF THE USER SUBTRACTS MORE WATER THAT THERE IS CURRENTLY IT ASIGNES 0
      yield LoadingState();
      if (event.values.waterIntake + event.ammount.toInt() >= 0) {
        final DayValues day = DayValues(
          dailyWaterTarget: event.values.dailyWaterTarget,
          day: event.values.day,
          waterIntake: event.values.waterIntake + event.ammount.toInt(),
          carbsIntake: event.values.carbsIntake,
          carbsIntakeLastWeek: event.values.carbsIntakeLastWeek,
          waterIntakeLastWeek: event.values.waterIntakeLastWeek,
        );
        yield new LoadedState(day);
      } else {
        // SET DAY VALUES WITH 0 WATER
        final DayValues day = DayValues(
          dailyWaterTarget: event.values.dailyWaterTarget,
          day: event.values.day,
          waterIntake: 0,
          carbsIntake: event.values.carbsIntake,
          carbsIntakeLastWeek: event.values.carbsIntakeLastWeek,
          waterIntakeLastWeek: event.values.waterIntakeLastWeek,
        );
        yield new LoadedState(day);
      }
    } else if (event is AddCarbs) {
      //! AddCarbs
      // THIS EVENT RECIVES THE OLD VALUES AND THE AMMOUNT OF CARBS THE USER ADDED
      // AS THE VALUE CAN BE NEGATIVE, BUT THE IOTAL CANT, THERE IS A CHECK
      // THAT IF THE USER SUBTRACTS MORE WATER THAT THERE IS CURRENTLY
      yield LoadingState();

      if (event.values.carbsIntake + event.ammount.toInt() >= 0) {
        final DayValues day = DayValues(
          dailyWaterTarget: event.values.dailyWaterTarget,
          day: event.values.day,
          waterIntake: event.values.waterIntake,
          carbsIntake: event.values.carbsIntake + event.ammount.toInt(),
          carbsIntakeLastWeek: event.values.carbsIntakeLastWeek,
          waterIntakeLastWeek: event.values.waterIntakeLastWeek,
        );
        yield new LoadedState(day);
      } else {
        // SET DAY VALUES WITH 0 CARBS
        final DayValues day = DayValues(
          dailyWaterTarget: event.values.dailyWaterTarget,
          day: event.values.day,
          waterIntake: event.values.waterIntake,
          carbsIntake: event.values.carbsIntake + event.ammount.toInt(),
          carbsIntakeLastWeek: event.values.carbsIntakeLastWeek,
          waterIntakeLastWeek: event.values.waterIntakeLastWeek,
        );
        yield new LoadedState(day);
      }
    }
  }
}
