import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timtrack/bloc/activities/activities.dart';
import 'package:timtrack/bloc/activities/activities_bloc.dart';
import 'package:timtrack/bloc/cycles/cycles_bloc.dart';
import 'package:timtrack/bloc/cycles/cycles_event.dart';
import 'package:timtrack/repository/activity_repository.dart';
import 'package:timtrack/repository/cycle_repository.dart';

import 'package:timtrack/routes/routes.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return ActivitiesBloc(
            activityRepository: ActivityRepository(),
          )..add(ActivitiesLoaded());
        }),
        BlocProvider(
          create: (context) {
            return CyclesBloc(
              cycleRepository: CycleRepository(),
            )..add(CyclesLoaded());
          },
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TimTrack',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.black87,
            size: 18,
          ),
          color: Colors.transparent,
          textTheme: TextTheme(
            headline6: TextStyle(
              color: Colors.black87,
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          elevation: 0,
        ),
      ),
      routes: routes,
      initialRoute: '/home',
    );
  }
}
