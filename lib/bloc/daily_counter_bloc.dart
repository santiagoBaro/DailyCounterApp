import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dailycounter_hydrated_bloc/model/day_values.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

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
    // TODO: implement mapEventToState
  }

  @override
  DailyCounterState fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    return null;
  }

  @override
  Map<String, dynamic> toJson(DailyCounterState state) {
    // TODO: implement toJson
    return null;
  }
}
