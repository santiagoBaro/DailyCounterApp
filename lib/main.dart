import 'package:dailycounter_hydrated_bloc/bloc/daily_counter_bloc.dart';
import 'package:dailycounter_hydrated_bloc/pages/initial_landing_page.dart';
import 'package:dailycounter_hydrated_bloc/pages/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = await HydratedBlocDelegate.build();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Counter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Counter'),
      ),
      body: BlocProvider(
        builder: (context) => DailyCounterBloc(),
        child: BlocBuilder<DailyCounterBloc, DailyCounterState>(
          builder: (BuildContext context, DailyCounterState state) {
            if (state is DailyCounterInitial) {
              return initialLandingPage(context);
            } else if (state is DailyCounterLoading) {
              return buildLoading();
            } else if (state is DailyCounterLoaded) {
              return buildColumnWithData(context, state.values);
            } else {
              return buildErrorScreen('No State Detectrerd');
            }
          },
        ),
      ),
    );
  }

  Widget buildLoading() {
    return Column(
      children: <Widget>[
        Text(
          'Getting your information',
          style: TextStyle(
            fontSize: 40,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 20,
        ),
        CircularProgressIndicator(),
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }

  Widget buildErrorScreen(String s) {
    return Center(
      child: Text(
        "an error ocurred: $s",
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}

Widget initialLandingPage(BuildContext context) {
  return InitialLandingPage();
}
