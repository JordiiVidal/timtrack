import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timtrack/bloc/activity/activity_bloc.dart';
import 'package:timtrack/bloc/cycle/cycle_bloc.dart';

import 'package:timtrack/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => new ActivityBloc()),
        BlocProvider(create: (_) => new CycleBloc()),
      ],
      child: MaterialApp(
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
              title: TextStyle(
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
      ),
    );
  }
}
