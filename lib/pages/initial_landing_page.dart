import 'package:dailycounter_hydrated_bloc/bloc/daily_counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              'stay on top\n of your\n daily habbits',
              style: TextStyle(fontSize: 30),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: FlatButton(
              onPressed: () {
                BlocProvider.of<DailyCounterBloc>(context)
                    .dispatch(InitializeValues());
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Start Tracking',
                  style: TextStyle(fontSize: 25),
                ),
              ),
              color: Colors.blueGrey,
            ),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
