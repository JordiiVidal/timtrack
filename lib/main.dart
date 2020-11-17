import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:timtrack/bloc/activities/activities.dart';
import 'package:timtrack/bloc/cycles/cycles.dart';
import 'package:timtrack/bloc/navigation/navigation.dart';

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
        BlocProvider(create: (context) {
          return CyclesBloc(
            cycleRepository: CycleRepository(),
          )..add(CyclesLoaded());
        }),
        BlocProvider(create: (context) {
          return NavigationBloc()..add(NavigationLoaded());
        })
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
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
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
