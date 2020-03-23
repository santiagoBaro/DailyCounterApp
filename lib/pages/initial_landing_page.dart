import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';

class InitialLandingPage extends StatefulWidget {
  InitialLandingPage({
    Key key,
  }) : super(key: key);

  @override
  _InitialLandingPageState createState() => _InitialLandingPageState();
}

class _InitialLandingPageState extends State<InitialLandingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Center(
            child: Text(
              'stay on top\nof your\ndaily habbits',
              style: TextStyle(fontSize: 30),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: TextField(
              onSubmitted: submitWaterIntake,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                hintText: "Enter your daily water target",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                suffixIcon: Icon(Icons.search),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                WhitelistingTextInputFormatter.digitsOnly
              ],
            ),
            // FlatButton(
            //   onPressed: () {
            //     BlocProvider.of<DailyCounterBloc>(context)
            //         .dispatch(InitializeValues());
            //   },
            //   child: Padding(
            //     padding: const EdgeInsets.all(10.0),
            //     child: Text(
            //       'Start Tracking',
            //       style: TextStyle(fontSize: 25),
            //     ),
            //   ),
            //   color: Colors.blueGrey,
            // ),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }

  void submitWaterIntake(String dailyWaterTarget) {
    // Get the Bloc using the BlocProvider

    final weatherBloc = BlocProvider.of<DailyCounterBloc>(context);
    // Initiate getting the weather
    weatherBloc.dispatch(InitializeValues(int.parse(dailyWaterTarget)));
  }
}
