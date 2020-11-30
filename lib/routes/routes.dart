import 'package:flutter/material.dart';
import 'package:timtrack/pages/create_activity.dart';
import 'package:timtrack/pages/home_page.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  '/home': (_) => HomePage(),
  '/addActivity': (_) => CreateActivity(),
};
