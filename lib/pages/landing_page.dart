import 'package:dailycounter_hydrated_bloc/bloc/daily_counter_bloc.dart';
import 'package:dailycounter_hydrated_bloc/model/bar_chart.dart';
import 'package:dailycounter_hydrated_bloc/model/chart_value.dart';
import 'package:dailycounter_hydrated_bloc/model/day_values.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';

Widget buildInitialInput(BuildContext context) {
  // ON FIRST INITIALIZACTION IT CALLS THIS METHOD
  // IT INITIALIZED THE DATA AND CALLS THE METHOD FOR
  // THE LOADED STATE
  var simplyfiedFormatter = new DateFormat('dd LLL');
  var secondFormatter = new DateFormat('E dd LLL');
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

  var day = DayValues(
    day: secondFormatter.format(newDate.add(Duration(days: -1))).toString(),
    waterIntake: 0,
    carbsIntake: 0,
    waterIntakeLastWeek: waterHistory,
    carbsIntakeLastWeek: carbsHistory,
  );

  BlocProvider.of<DailyCounterBloc>(context).dispatch(LoadNewDate(day));
  return Container();
  // CALLS THE LOADED STATE METHOD
}

Widget buildColumnWithData(BuildContext context, DayValues values) {
  // THIS METHOD IS CALLED ON THE lOADED STATE
  //

  return SingleChildScrollView(
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text(
            "${values.day}",
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Water Intake',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Objective: 3,5 L',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          RoundedProgressBar(
            childLeft: Center(
              child: Text("${values.waterIntake} ml",
                  style: TextStyle(color: Colors.white)),
            ),
            theme: RoundedProgressBarTheme.blue,
            percent: values.waterIntakePerc(),
          ),
          // WATER INTAKE POSITIVE VALUES
          Row(
            children: <Widget>[
              FlatButton(
                child: Text(
                  "250 ml",
                ),
                onPressed: () {
                  BlocProvider.of<DailyCounterBloc>(context).dispatch(
                    AddWater(
                      250,
                      values,
                    ),
                  );
                },
                color: Colors.blue[300],
              ),
              FlatButton(
                child: Text("600 ml"),
                onPressed: () {
                  BlocProvider.of<DailyCounterBloc>(context).dispatch(
                    AddWater(
                      600,
                      values,
                    ),
                  );
                },
                color: Colors.blue[300],
              ),
              FlatButton(
                child: Text("1 L"),
                onPressed: () {
                  BlocProvider.of<DailyCounterBloc>(context).dispatch(
                    AddWater(
                      1000,
                      values,
                    ),
                  );
                },
                color: Colors.blue[300],
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
          // WATER INTAKE NEGATIVE VALUES
          Row(
            children: <Widget>[
              FlatButton(
                child: Text("-250 ml"),
                onPressed: () {
                  BlocProvider.of<DailyCounterBloc>(context).dispatch(
                    AddWater(
                      -250,
                      values,
                    ),
                  );
                },
                color: Colors.black12,
              ),
              FlatButton(
                child: Text("-600 ml"),
                onPressed: () {
                  BlocProvider.of<DailyCounterBloc>(context).dispatch(
                    AddWater(
                      -600,
                      values,
                    ),
                  );
                },
                color: Colors.black12,
              ),
              FlatButton(
                child: Text("-1 L"),
                onPressed: () {
                  //
                  BlocProvider.of<DailyCounterBloc>(context).dispatch(
                    AddWater(
                      -1000,
                      values,
                    ),
                  );
                },
                color: Colors.black12,
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 2,
              color: Colors.black12,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Carbohidrates',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          RoundedProgressBar(
            childLeft: Center(
              child: Text("${values.carbsIntake} gr",
                  style: TextStyle(color: Colors.white)),
            ),
            theme: RoundedProgressBarTheme.red,
            percent: values.carbsIntakePerc(),
          ),
          SizedBox(
            height: 20,
          ),
          // CARBS INTAKE BUTTONS
          Row(
            children: <Widget>[
              Ink(
                decoration: const ShapeDecoration(
                  color: Colors.black12,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  icon: Icon(Icons.exposure_neg_1),
                  onPressed: () {
                    BlocProvider.of<DailyCounterBloc>(context).dispatch(
                      AddCarbs(
                        -1,
                        values,
                      ),
                    );
                  },
                ),
              ),
              Ink(
                decoration: const ShapeDecoration(
                  color: Colors.lightBlue,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  icon: Icon(Icons.exposure_plus_1),
                  onPressed: () {
                    BlocProvider.of<DailyCounterBloc>(context).dispatch(
                      AddCarbs(
                        1,
                        values,
                      ),
                    );
                  },
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            'Carbohidrates History - gr',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          SizedBox(
            child: SimpleBarChart(
              _getCarbsData(values),
            ),
            height: 300,
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 2,
              color: Colors.black12,
            ),
          ),
          Text(
            'Water History - ml',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          SizedBox(
            child: SimpleBarChart(
              _getWaterData(values),
            ),
            height: 300,
          ),
          SizedBox(
            height: 40,
          ),
          //SimpleBarChart.withSampleData(),
        ],
      ),
    ),
  );
}

// CHARTRS DATA FORMATS

List<charts.Series<ChartValue, String>> _getWaterData(DayValues values) {
  return [
    new charts.Series<ChartValue, String>(
      id: 'Water',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (ChartValue instance, _) => instance.date,
      measureFn: (ChartValue instance, _) => instance.ammount,
      data: values.waterIntakeLastWeek,
    )
  ];
}

List<charts.Series<ChartValue, String>> _getCarbsData(DayValues values) {
  return [
    new charts.Series<ChartValue, String>(
      id: 'Carbs',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (ChartValue instance, _) => instance.date,
      measureFn: (ChartValue instance, _) => instance.ammount,
      data: values.carbsIntakeLastWeek,
    )
  ];
}
