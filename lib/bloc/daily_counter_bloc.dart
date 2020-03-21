import 'dart:async';
import 'package:dailycounter_hydrated_bloc/model/chart_value.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:dailycounter_hydrated_bloc/model/day_values.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import '../model/day_values.dart';

part 'daily_counter_event.dart';
part 'daily_counter_state.dart';

class DailyCounterBloc
    extends HydratedBloc<DailyCounterEvent, DailyCounterState> {
  @override
  DailyCounterState get initialState {
    return super.initialState ?? DailyCounterInitial();
  }

  @override
  Stream<DailyCounterState> mapEventToState(
    DailyCounterEvent event,
  ) async* {
    if (event is LoadNewDate) {
      // THIS EVENT SETS THE STATE OF THE APP TO THE CURRENT DATE
      // INITIALIZEING THE INTAKE VALUES IN 0
      // AND UPDATES THE USERS HISTORY

      yield DailyCounterLoading();

      List<ChartValue> carbsHistory;
      List<ChartValue> waterHistory;
      waterHistory = event.oldValues.waterIntakeLastWeek;
      carbsHistory = event.oldValues.carbsIntakeLastWeek;

      // REMOVES OLDEST DATE VALUES
      waterHistory.removeAt(0);
      carbsHistory.removeAt(0);

      String simplypiedDate = event.oldValues.day.substring(3);
      //event.oldValues.day = simplypiedDate;
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
      var day = DayValues(
        day: formatter.format(newDate).toString(),
        waterIntake: 0,
        carbsIntake: 0,
        waterIntakeLastWeek: waterHistory,
        carbsIntakeLastWeek: carbsHistory,
      );

      yield DailyCounterLoaded(day);
    } else if (event is AddWater) {
      // THIS EVENT RECIVES THE OLD VALUES AND THE AMMOUNT OF WATER THE USER ADDED
      // AS THE VALUE CAN BE NEGATIVE, BUT THE TOTAL CANT, THERE IS A CHECK
      // THAT IF THE USER SUBTRACTS MORE WATER THAT THERE IS CURRENTLY IT ASIGNES 0
      //yield DailyCounterLoading();
      if (event.values.waterIntake + event.ammount.toInt() >= 0) {
        DayValues day = DayValues(
          day: event.values.day,
          waterIntake: event.values.waterIntake + event.ammount.toInt(),
          carbsIntake: event.values.carbsIntake,
          carbsIntakeLastWeek: event.values.carbsIntakeLastWeek,
          waterIntakeLastWeek: event.values.waterIntakeLastWeek,
        );
        yield new DailyCounterLoaded(day);
      } else {
        DayValues day = DayValues(
          day: event.values.day,
          waterIntake: 0,
          carbsIntake: event.values.carbsIntake,
          carbsIntakeLastWeek: event.values.carbsIntakeLastWeek,
          waterIntakeLastWeek: event.values.waterIntakeLastWeek,
        );
        yield new DailyCounterLoaded(day);
      }
    } else if (event is AddCarbs) {
      // THIS EVENT RECIVES THE OLD VALUES AND THE AMMOUNT OF CARBS THE USER ADDED
      // AS THE VALUE CAN BE NEGATIVE, BUT THE IOTAL CANT, THERE IS A CHECK
      // THAT IF THE USER SUBTRACTS MORE WATER THAT THERE IS CURRENTLY
      //yield DailyCounterLoading();

      if (event.values.carbsIntake + event.ammount.toInt() >= 0) {
        DayValues day = DayValues(
          day: event.values.day,
          waterIntake: event.values.waterIntake,
          carbsIntake: event.values.carbsIntake + event.ammount.toInt(),
          carbsIntakeLastWeek: event.values.carbsIntakeLastWeek,
          waterIntakeLastWeek: event.values.waterIntakeLastWeek,
        );
        yield new DailyCounterLoaded(day);
      } else {
        DayValues day = DayValues(
          day: event.values.day,
          waterIntake: event.values.waterIntake,
          carbsIntake: event.values.carbsIntake + event.ammount.toInt(),
          carbsIntakeLastWeek: event.values.carbsIntakeLastWeek,
          waterIntakeLastWeek: event.values.waterIntakeLastWeek,
        );
        yield new DailyCounterLoaded(day);
      }
    }
  }

  @override
  DailyCounterState fromJson(Map<String, dynamic> json) {
    try {
      final weather = DayValues.fromJson(json);
      return DailyCounterLoaded(weather);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson(DailyCounterState state) {
    if (state is DailyCounterLoaded) {
      return state.values.toJson();
    } else {
      return null;
    }
  }
}
