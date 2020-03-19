import 'dart:async';
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
      //TODO
      yield DailyCounterLoading();
      var formatter = new DateFormat('E dd LLL');
      var newDate = DateTime.now();
      var day = DayValues(
        day: formatter.format(newDate).toString(),
        waterIntake: 0,
        carbsIntake: 0,
      );
      yield DailyCounterLoaded(day);
    } else if (event is UpdateValues) {
      //TODO
    } else if (event is AddWater) {
      //TODO
    } else if (event is AddCarbs) {
      //TODO
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
