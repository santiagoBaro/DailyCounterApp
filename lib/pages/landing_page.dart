import 'package:dailycounter_hydrated_bloc/model/day_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';

Widget buildInitialInput() {}

Widget buildColumnWithData(DayValues values) {
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
            'Consumo de agua',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'objetivo: 3,5 L',
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
          Row(
            children: <Widget>[
              FlatButton(
                child: Text(
                  "250 ml",
                ),
                onPressed: () {
                  // setState(() {
                  //   currentDay.addWater(250);
                  //   db.update(currentDay);
                  // });
                },
                color: Colors.blue[300],
              ),
              FlatButton(
                child: Text("600 ml"),
                onPressed: () {
                  // setState(() {
                  //   currentDay.addWater(600);
                  //   db.update(currentDay);
                  // });
                },
                color: Colors.blue[300],
              ),
              FlatButton(
                child: Text("1 L"),
                onPressed: () {
                  // setState(() {
                  //   currentDay.addWater(1000);
                  //   db.update(currentDay);
                  // });
                },
                color: Colors.blue[300],
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
          Row(
            children: <Widget>[
              FlatButton(
                child: Text("-250 ml"),
                onPressed: () {
                  // setState(() {
                  //   currentDay.addWater(-250);
                  //   db.update(currentDay);
                  // });
                },
                color: Colors.black12,
              ),
              FlatButton(
                child: Text("-600 ml"),
                onPressed: () {
                  // setState(() {
                  //   currentDay.addWater(-600);
                  //   db.update(currentDay);
                  // });
                },
                color: Colors.black12,
              ),
              FlatButton(
                child: Text("-1 L"),
                onPressed: () {
                  // setState(() {
                  //   currentDay.addWater(-1000);
                  //   db.update(currentDay);
                  // });
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
            'Carbohidratos',
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
                    // setState(() {
                    //   currentDay.addCarbs(-1);
                    //   db.update(currentDay);
                    // });
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
                    // setState(() {
                    //   currentDay.addCarbs(1);
                    //   db.update(currentDay);
                    // });
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
            'Historial Carbohidratos - gr',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          // SizedBox(
          //   child: SimpleBarChart(_getCarbsData()),
          //   height: 300,
          // ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 2,
              color: Colors.black12,
            ),
          ),
          Text(
            'Historial Agua - ml',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          // SizedBox(
          //   child: SimpleBarChart(_getWaterData()),
          //   height: 300,
          // ),
          SizedBox(
            height: 40,
          ),
          //SimpleBarChart.withSampleData(),
        ],
      ),
    ),
  );
}
